class ArticlesController < ApplicationController
  def index
  end

  # The create action is not going to have a template, we need to handle what is being sent in
  def create
    # The form data is being sent in through the params hash
    # This just displays it
    #render plain: params[:article].inspect

    # But now we need to save it to the database
    # We cannot just directly pass in what is coming from the params hash, we need to whitelist the values
    @article = Article.new(article_params)
    @article.save
    # The article will be successfully saved INSERTED into the db
    # but it will not go to the next page since the template doesnt exist

    # We are going to redirect to articles#show to show article after it creates
    redirect_to articles_show(@article)
  end

  def new
    @article = Article.new
    # rest of this is geting the input with a form in the view template articles/new.html.erb
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
