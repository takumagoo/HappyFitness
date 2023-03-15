class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.new
  end

  def edit
    # 画像登録もする
     @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path
  end


  def member
    @customer = Customer.new

    # パラメータ
    content = current_customer.id # QRコードの中身 会員情報を入れたいときは会員のurlを入れる
    xdim    = 3  # 一番細いバーの幅

    code128 = Barby::Code128B.new(content)

    # HTMLのimgタグ用のbase64で出力
    @barcode = code128.to_image(xdim: xdim).to_data_url
  end

  private

   # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :year_birth, :age, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end
