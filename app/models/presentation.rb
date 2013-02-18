class Presentation < ActiveRecord::Base
  include HTTParty

  attr_accessible :talk, :title, :url, :token, :author_name, :author_url, :data

  SPEAKERDECK_OEMBED_ENDPOINT = "https://speakerdeck.com/oembed.json?url="

  belongs_to :talk

  before_save :get_info

  def get_info
    # change this into a resque event
    request = HTTParty.get(SPEAKERDECK_OEMBED_ENDPOINT + url)
    if request.response.code == "200"
      info_hash = hash_from_speakerdeck_response(JSON.parse(request.body))
      info_hash.each{ |k, v| self.send("#{k}=".to_sym, v) }
    end
  end

  def hash_from_speakerdeck_response(info)
    {
      :author_name => info["author_name"],
      :author_url => info["author_url"],
      :title => info["title"],
      :token => info["html"].match(/speakerdeck.com\/player\/([a-zA-Z0-9]+)/)[1],
      :data => info.to_s
    }
  end
end