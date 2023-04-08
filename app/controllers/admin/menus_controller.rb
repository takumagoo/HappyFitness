class Admin::MenusController < ApplicationController

  def index
    @genre = Genre.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to admin_menu_path(@menu.id
)
    else
      render :new
    end

  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to admin_menu_path(menu.id)
  end

  def destroy
    menu = Menu.find(params[:id])
    genre_id = menu.genre.id
    menu.destroy
    redirect_to admin_index_path(genre_id)
  end

  def menu_params
    params.require(:menu).permit(:genre_id, :name, :explanation)
  end

end
