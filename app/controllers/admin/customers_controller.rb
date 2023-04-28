class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    redirect_to admin_root_path
  end


  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path
  end

  private

   # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :year_birth, :age, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
