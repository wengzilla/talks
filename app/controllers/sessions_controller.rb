class SessionsController < Devise::SessionsController
  skip_before_filter :store_location
end