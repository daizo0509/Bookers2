class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :edit, :create, :update, :destroy]

  def index
  end

  def show
      @user = User.find(params[:id])
      @books = Book.find(params[:id])
      @book = Book.new
  end

  def new
      @user = current_user
  		@books = Book.all
  		@book = Book.new
  end

  def edit
  		@book = Book.find(params[:id])
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
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to new_book_path
  end

  private
  	def book_params
  		params.require(:book).permit(:title,:body)
  	end
end

