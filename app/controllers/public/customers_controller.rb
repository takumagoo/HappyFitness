
require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'

class Public::CustomersController < ApplicationController
  # ログインした会員のみアクセスできる
  before_action :is_matching_login_customer, only: [:edit, :update]

  # ゲストユーザーとしてログインした場合は閲覧を制限する
  before_action :guest_check, only: [:show, :edit, :update]

  def show
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  def member #会員証画面
    @customer = Customer.new
    # パラメータ
    content = "#{current_customer.id}, #{current_customer.full_name}, #{current_customer.email}" # QRコードの中身
    size    = 3 # QRコードのバージョン 1〜40
    level   = :m # 誤り訂正レベル, l/m/q/h
    xdim    = 3  # 一番細いバーの幅

    # QRコード生成
    qrcode = Barby::QrCode.new(content, size: size, level: level)
    @barcode = qrcode.to_image(xdim: xdim).to_data_url
  end

  private

   # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :year_birth, :age, :email, :postal_code, :address, :telephone_number, :is_deleted, :profile_image)
  end

  # 会員アクセス制限
  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to customers_member_path
    end
  end

 #ゲストログインアクセス制限
  def guest_check
    if current_customer.email == 'guest@example.com'
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end
end
