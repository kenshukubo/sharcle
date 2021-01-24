class ApplicationController < ActionController::Base

  def store_current_location
    return if current_user
    store_location_for(:user, request.url)
  end
end
