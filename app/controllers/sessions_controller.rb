class SessionsController < ApplicationController

  # We are simply creating a session and then deleting the session and all that info is going to be handled by
  # a session hash which is backed by the browser and at no point will it hit the database. So, form_for doesn't know
  # what route to create for you so we do not have to specify the route.

  # will get the login form
  def new
  end

  # handle the submission of the login form
  def create
    # since it is not an instance variable we do not have to put @ in front of user
    # params hash has the session hash which has the email and password values
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # saving the user's id in the session hash which is backed by the browser's cookies
      session[:user_id] = user.id

      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      # flash happens upon a http request and since renderin new is not a new http request we have to do flash.now
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  # will delete the login login form and route to sessions/logout
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end
