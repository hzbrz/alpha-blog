class ArticlesController < ApplicationController
  def index
    # Grabs all the articles and stores it in the instance variable @articles so it is usable in the view
    @articles = Article.all
  end

  # The create action is not going to have a template, we need to handle what is being sent in
  def create
    # The form data is being sent in through the params hash
    # This just displays it
    #render plain: params[:article].inspect

    # But now we need to save it to the database
    # We cannot just directly pass in what is coming from the params hash, we need to whitelist the values
    @article = Article.new(article_params)

    # we were assuming that the article will save and go to the redirected path
    # but what if the attributes don't pass the validations in the model, then what do we show
    # lets take care of that using some conditional logic
    if @article.save
      # if the article is saved we show a little flash message, but now it has to be displayed somewhere
      # All of the views are wrapped in one view wrapper class: 'application.html.erb' view,
      # so anything put there will show on every page
      flash[:notice] = "Article was successfully created!"

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
    @article = Article.find(params[:id])
  end

  def show
    # The article path takes in an id (articles/:id)
    # So using the params hash we get the id and find it to display the article
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    # Same logic for checking model validations but instead of 'save' here is 'update'
    # Before in the create action the @article instance variable was already holding the whitelisted form data
    # But here we pass in (article_params) method as an argument so the .update function knows what to update based upon
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated."
      # successfully updated then we redirect the user to show page
      redirect_to article_path(@article)
    else
      # if the validation is hit then render the 'edit' action and view again with the error messages on the view.
      render 'edit'
    end
  end

  # private block has to go at the end otherwise the other methods are not visible anymore
  private
    # whitelisting method
    def article_params
      # top level key is :article
      # and for the key that is :article we are going to permit the values :title and :description
      # So basically from the params hash we are gonna allow these
      # and with that we are gonna construct a new instance variable - line 13 and then we save it - line 14
      params.require(:article).permit(:title, :description)
    end
end
