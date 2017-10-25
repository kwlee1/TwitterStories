class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  def current_story
    Story.find(session[:story_id]) if session[:story_id]
  end 
  helper_method :current_user
  helper_method :current_story
end
