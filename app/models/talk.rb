class Talk < ActiveRecord::Base
  attr_accessible :title, :description, :presentation_attributes, :video_attributes, :transitions

  has_one :presentation
  has_one :video

  accepts_nested_attributes_for :video
  accepts_nested_attributes_for :presentation

  def self.initialize_with_nested_models
    Talk.new.tap do |talk|
      talk.build_video
      talk.build_presentation
    end
  end
end