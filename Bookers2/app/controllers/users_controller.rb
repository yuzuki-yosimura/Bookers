class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post_feelings = @user.post_feelings.all
    @post_feeling = PostFeeling.new
  end

  def edit
    @user = User.find(params[:id])
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
    @post_feeling = PostFeeling.new
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
