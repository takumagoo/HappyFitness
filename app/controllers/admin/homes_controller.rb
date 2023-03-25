class Admin::HomesController < ApplicationController
  def top
      @customers = Customer.all.page(params[:page]).per(10)
  end
end
