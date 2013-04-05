User.create(:username => "edweng", :email => "edweng@gmail.com", :password => "hungry")

Talk.create(:title => "What's new in Ruby 2.0 by Gabriel Fortuna",
  :description => "Ruby on Beer 2013 - Johannesburg",
  :presentation_attributes => {:url => "https://speakerdeck.com/geeforr/whats-new-in-ruby-2-dot-0"},
  :video_attributes => {:url => "http://www.youtube.com/watch?v=g4sqydY3hHU"},
  :transitions => "1@0:02, 2@0:04, 3@0:06, 4@0:10, 5@1:00",
  :user => User.first
)