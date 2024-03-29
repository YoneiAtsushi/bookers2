class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    # @book_user = Book.find(params[:id])
    # @user = User.find(params[:id])
    # @book_user = @user.books
    

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
   else
    @books = Book.all
    @user = current_user
    render :index
   end
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @books = Book.all
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
    # @book = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
     if
      @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
     redirect_to book_path(@book.id)
     else
      render :edit
     end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
      book = Book.find(params[:id])
   unless book.user.id == current_user.id
       redirect_to books_path
   end
  end
end
