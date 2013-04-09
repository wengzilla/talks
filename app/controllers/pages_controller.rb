class PagesController < ApplicationController
  protect_from_forgery
  before_filter :set_full_width

  def contact
    @people = [
      {
        :name => "Ed Weng",
        :twitter_handle => "wengzilla",
        :profile_photo_url => "ed_profile.jpg",
        :bio => "Ed is a part-time entrepreneur and a full-time hacker. He enjoys long walks on the beach and a strong refactor."
      }, 
      {
        :name => "Ben Dear",
        :twitter_handle => "Ben_Dear",
        :profile_photo_url => "ben_profile.jpg"
      }]
  end
end
