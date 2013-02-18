class Video < ActiveRecord::Base
  attr_accessible :talk, :url

  belongs_to :talk
end