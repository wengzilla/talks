class Video < ActiveRecord::Base
  attr_accessible :talk, :url, :duration

  belongs_to :talk
  before_save :get_info

  def get_info
    info_hash = YoutubeParser.search(url).first
    info_hash.each{ |k, v| self.send("#{k}=".to_sym, v) }
  end
end