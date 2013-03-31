class Video < ActiveRecord::Base
  attr_accessible :talk, :url, :duration

  belongs_to :talk
  before_save :set_youtube_attributes

  def set_youtube_attributes
    youtube_response = YoutubeParser.search(url).first
    youtube_response.each do |key, value|
      self.send("#{key.to_sym}=", value)
    end
  end
end