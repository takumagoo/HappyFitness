class Admin::MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    menu = Menu.new(menu_params)
    menu.save
    redirect_to admin_menu_path(menu.id)
  end

  def show
    @menu = Menu.find(params[:id])
    @genres = Genre.all
  end

  def edit

  end

  def menu_params
    params.require(:menu).permit(:genre_id, :name, :explanation)
  end

end
