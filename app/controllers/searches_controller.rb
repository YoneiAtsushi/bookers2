class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]
     
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      # params[:search]検索方法、params[:word検索ワード、検索方法て何？
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end