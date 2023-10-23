class BooksController < ApplicationController
  def new
  end

  def index 
    @book = Book.new
    @books = Book.all
    @user = current_user
    # @book_user = Book.find(params[:id])
    # @user = User.find(params[:id])
    # @book_user = @user.books   
    # @users = User.find(params[:id])
   
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
     @book = Book.find(params[:id])
   if
     @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
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
  
end
