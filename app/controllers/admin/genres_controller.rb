class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    # リダイレクト (一応：一覧画面へ)
    redirect_to admin_genres_path
  end

  def edit
    @genre= Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    # リダイレクト (一応：一覧画面へ)
    redirect_to admin_genres_path
  end

  private

   # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end

end
