class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:post_image_id])
  end
end
