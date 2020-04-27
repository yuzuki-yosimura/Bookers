class PostFeelingsController < ApplicationController
  before_action :sign_in_required, only: [:show, :edit]

  def new
    @post_feeling = PostFeeling.new
  end

  def create
    @post_feeling = PostFeeling.new(post_feeling_params)
    @post_feeling.user_id = current_user.id
    if @post_feeling.save
      flash[:success] = 'Book was successfully created.'
      redirect_to post_feeling_path(@post_feeling.id)
    else
      render :new
    end
  end

  def index
    @post_feelings = PostFeeling.all
    @post_feeling = PostFeeling.new
  end

  def show
    @post_feeling = PostFeeling.find(params[:id])
    @post_feeling_new = PostFeeling.new
  end

  def destroy
      @post_feeling = PostFeeling.find(params[:id])
      @post_feeling.destroy
      flash[:success] = 'Book was successfully destroyed.'
      redirect_to post_feelings_path
  end

  def edit
    @post_feeling = PostFeeling.find(params[:id])
  end

  def update
    @post_feeling = PostFeeling.find(params[:id])
    if @post_feeling.update(post_feeling_params)
    flash[:success] = 'Book was successfully edited.'
    redirect_to post_feeling_path(@post_feeling.id)
    else
      render :edit
    end
  end

private
  def post_feeling_params
    params.require(:post_feeling).permit(:title, :body)
  end

end
