User.create(:username => "edweng", :email => "edweng@gmail.com", :password => "hungry")

Talk.create(:title => "Designing Hypermedia APIs by Steve Klabnik",
  :description => "Railsconf 2012 - Austin, TX",
  :presentation_attributes => {:url => "https://speakerdeck.com/apistrat/hypermedia-apis-for-the-enterprise"},
  :video_attributes => {:url => "http://www.youtube.com/watch?v=g4sqydY3hHU"},
  :transitions => "1@0:02, 2@0:04, 3@0:06, 4@0:10, 5@1:00",
  :user => User.first
)