class Public::MenusController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  
  def show
    @menu = Menu.find(params[:id])
  end
end
