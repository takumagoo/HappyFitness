# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

   # ゲストログイン
  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected
  
  # 退会しているかを判断するメソッド
  def reject_customer
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])

    if @customer == nil
      flash[:notice] = "登録されていません"
      # byebug
      redirect_to new_customer_registration_path
    elsif @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
      flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
      redirect_to new_customer_registration_path
    else
      flash[:notice] = "項目を入力してください"
    end
  end

end
