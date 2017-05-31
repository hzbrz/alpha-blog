class PagesController < ApplicationController
  def home
    # If the user is logged in redirect them to see all the articles
    redirect_to articles_path if logged_in?
  end

  def about
  end
end
