class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :sign_in_required, only: [:show, :edit, :index]

  def show
    @user = User.find(params[:id])
    @post_feelings = @user.books.all
    @post_feeling = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if(current_user.id != @user.id) 
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile was successfully edited.'
      redirect_to user_path(@user.id)
    else
      flash[:danger] = 'Profile was not edited correctly'
      render :edit
    end
  end

  def index
    @users = User.all
    @post_feeling = Book.new
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
