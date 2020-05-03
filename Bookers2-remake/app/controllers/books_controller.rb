class BooksController < ApplicationController
  before_action :sign_in_required, only: [:show, :edit, :index]

  def new
    @post_feeling = Book.new
  end

  def create
    @post_feeling = Book.new(post_feeling_params)
    @post_feeling.user_id = current_user.id
    if @post_feeling.save
      flash[:success] = 'Book was successfully created.'
      redirect_to book_path(@post_feeling.id)
    else
      render :new
    end
  end

  def index
    @post_feelings = Book.all
    @post_feeling = Book.new
  end

  def show
    @post_feeling = Book.find(params[:id])
    @post_feeling_new = Book.new
  end

  def destroy
      @post_feeling = Book.find(params[:id])
      @post_feeling.destroy
      flash[:success] = 'Book was successfully destroyed.'
      redirect_to books_path
  end

  def edit
    @post_feeling = Book.find(params[:id])
    if(current_user.id != @post_feeling.user.id) 
      redirect_to books_path
    end
  end

  def update
    @post_feeling = Book.find(params[:id])
    if @post_feeling.update(post_feeling_params)
    flash[:success] = 'Book was successfully edited.'
    redirect_to book_path(@post_feeling.id)
    else
      render :edit
    end
  end

private
  def post_feeling_params
    params.require(:book).permit(:title, :body)
  end

end
