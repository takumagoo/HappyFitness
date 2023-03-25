class Public::GenresController < ApplicationController
  def index
    @genres = Genre.all

    # ジャンル種類選別
    if params[:search]
      @genre = Genre.find(params[:genre])
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

end
