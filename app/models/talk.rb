class Talk < ActiveRecord::Base
  attr_accessible :title, :description, :presentation_attributes, :video_attributes, :transitions, :user

  has_one :presentation
  has_one :video
  belongs_to :user

  accepts_nested_attributes_for :video
  accepts_nested_attributes_for :presentation

  def self.initialize_with_nested_models
    Talk.new.tap do |talk|
      talk.build_video
      talk.build_presentation
    end
  end

  def transitions_json
    # Converts string of 1@0:02, 2@0:04, 3@ 0:06, 4@0:10, 5@1:00 to array of hashes
    if transitions
      pairs = transitions.split(",")
      pairs.map do |pair|
        slide, time = pair.split("@")
        { :slide => slide.to_i, :time => ChronicDuration::parse(time) }
      end.to_json
    end
  end
end