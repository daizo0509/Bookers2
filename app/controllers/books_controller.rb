class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def top
    
  end

  def index
      @book = Book.new
      @book = Book.all
      @user = current_user

  end

  def new
      @book = Book.new
      @book = Book.all
      @user = current_user
  end

  def show
      @books = Book.find(params[:id])
      @book = Book.new
      @user = @books.user
  end

  def edit
  		@book = Book.find(params[:id])
      if @book.user.id != current_user.id
        redirect_to book_path(@book)
      end

  end

  def create
  		@book = Book.new(book_params)
      @book.user_id = current_user.id
  		@book.save
  		redirect_to book_path(@book.id)
  end

   def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book.id)
  end

  def destroy
  	  @book = Book.find(params[:id])
  	  @book.destroy
  	  redirect_to user_path(current_user)
  end

  private
  	def book_params
  		params.require(:book).permit(:title,:body)
  	end
end

