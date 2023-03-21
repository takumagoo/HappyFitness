class Public::GenresController < ApplicationController
  def index
    # @genre = Genre.new
    @genre = Genre.find(params[:genre])
    # @genre = Genre.find(params[:id])
  end

  def show
     @genre = Genre.find(params[:id])
  end

end
