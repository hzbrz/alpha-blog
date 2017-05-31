class ApplicationController < ActionController::Base
  # Prevents CSRF attacks by raising an exception
  # For API's you may want to use :null_session instead
  protect_from_forgery with: :exception

  # These are methods to check if the user is logged in and what they can do it they are
  # Methods built in the ApplicationController is available in all the other controllers but not the views

  # So to use them in views we let rails know that they are helper methods
  helper_method :current_user, :logged_in?

  def current_user
    # if our session has an user id, then go through the database and find that user id and return it
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    # What if we already have looked for this current_user(lets say with the id of 7) so everytime current_user
    # is referenced it is going to keep hitting the db and we do not want that?
      # @current_user takes care of that - it returns the current_user if it already exists, and if not then
      # this (User.find(session[:user_id]) if session[:user_id]) runs and it tries to find the current_user
  end

  def logged_in?
    # to convert anything into a boolean you just to !!then_the_var_name
    !!current_user # returns true if current_user exists...false if it doesn't
  end

  def require_user
     if !logged_in?
       flash[:danger] = "You must be logged in to perform that action"
       redirect_to root_path
     end
  end
end
