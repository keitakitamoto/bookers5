class SearchesController < ApplicationController
    def search
        @range = params[:range]
      if @range == "User"
        @users = User.looks(params[:search],　params[:word])
      else
        @books = Book.looks(params[:search], params[:word])
      end
    end
end
