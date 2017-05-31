class ArticlesController < ApplicationController
  # before_action is used to make sure that a spcified method is called - in this case the 'set_article_instance_to_id'
  # before any other action takes place within the method it is being called in
  # for example the update method will call set_article_instance_to_id before doing anything else inside the update method
  before_action :set_article_instance_to_id, only: [:edit, :show, :update, :destroy]
  # The before_action method takes two parameters
  # One is the method name, for example - (set_article_instance_to_id)
  # And the other to specify where it should be used, this is done using the only keyword and then the methods

  # Apply before_action to the methods except these one, that is what the except array does
  # We are putting this require_user method on every other method except for the ones listed below to make sure...
  # that no one can mess with anything if they are logged in
  before_action :require_user, except: [:index, :show]

  # method defined on line 118 check to see how it (require_same_user) works
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    # Adds pagination using the will_paginate gem: https://github.com/mislav/will_paginate
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  # The create action is not going to have a template, we need to handle what is being sent in and redirect
  def create
    # The form data is being sent in through the params hash
    # This just displays it
    #render plain: params[:article].inspect

    # But now we need to save it to the database
    # We cannot just directly pass in what is coming from the params hash, we need to whitelist the values
    @article = Article.new(article_params)

    # When the form is submitted and an article is about to created it sets that article to the last User so it has an
    # User associated with it, otherwise it throws a validation error setup in the Article model that requires each article
    # to have an User associated with it . So this is a hard coded and a temporary fix that will be taken out after auth
    # @article.user = User.last

    # This is the right way after authentication has been added, go to ApplicationController to see how current_user works
    @artucle.user = current_user

    # we were assuming that the article will save and go to the redirected path
    # but what if the attributes don't pass the validations in the model, then what do we show
    # lets take care of that using some conditional logic
    if @article.save
      # if the article is saved we show a little flash message, but now it has to be displayed somewhere
      # All of the views are wrapped in one view wrapper class: 'application.html.erb' view,
      # so anything put there will show on every page
      flash[:success] = "Article was successfully created!"

      # We are going to redirect to articles#show (/articles/:id, prefix: article)to show article after it creates
      redirect_to article_path(@article)
      # The article will be successfully saved INSERTED into the db
      # but it will not go to the next page since the template doesnt exist
    else
      # if it does hit the validations and get stuck then just refresh the page and render the new action and view
      # and create a new @article instance variable, but thats not right it doesn't tell the user what went wrong
      # We need to display the validations that are keeping my articles from getting saved, we do that in new.html.erb
      render 'new'
    end
  end

  def new
    @article = Article.new
    # rest of this is geting the input with a form in the view template articles/new.html.erb
  end

  def edit
    # This is a method that was created down in the private block to get rid of redundant code
  end

  def show
    # The article path takes in an id (articles/:id)
    # So using the params hash we get the id and find it to display the article
    # The 'params' come from the user's browser when they request the page.
    # For example, if a user's browser requested - http://www.example.com/?foo=1&boo=octopus
    # then params[:foo] would be "1" and params[:boo] would be "octopus".
  end

  # the update function is used to edit the articles
  def update
    # Same logic for checking model validations but instead of 'save' here is 'update'
    # Before in the create action the @article instance variable was already holding the whitelisted form data
    # But here we pass in (article_params) method as an argument so the .update function knows what to update based upon
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      # successfully updated then we redirect the user to show page
      redirect_to article_path(@article)
    else
      # if the validation is hit then render the 'edit' action and view again with the error messages on the view.
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  # private block has to go at the end otherwise the other methods are not visible anymore
  private

    # Method to take care of redundant code
    def set_article_instance_to_id
      # found the article based on the id on the params hash

      @article = Article.find(params[:id])
      # here the params[:id] is the is the number in - localhost:3000/article/1
      # thus allowing us to find or grab each article object
    end

    # whitelisting method
    def article_params
      # top level key is :article
      # and for the key that is :article we are going to permit only the attributes :title and :description
      # So basically from the params hash we are gonna allow these
      # and with that we are gonna construct a new instance variable - line 24 and then we save it - line 29
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
      end
    end
end
