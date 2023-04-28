class Public::GenresController < ApplicationController
  before_action :authenticate_customer!, except: [:top]

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
