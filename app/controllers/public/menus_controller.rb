class Public::MenusController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
  end
end
