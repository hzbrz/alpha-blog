class UsersController < ApplicationController

  before_action :set_user_instance_to_id, only: [:edit, :show, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    # Adding pagination for the show view and since it is using the article partial we have to paginate over that
    # We cannot paginate over the user since it is only one user, so we have to paginate over the articles
    # user_articles holds all the articles for that user
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account was successfully updated!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private
    def set_user_instance_to_id
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
