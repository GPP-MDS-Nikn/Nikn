class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Check authorization for every action, unless its made by a devise model
  check_authorization :unless => :devise_controller?
end
