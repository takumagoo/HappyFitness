class Admin::HomesController < ApplicationController
  def top
      @customers = Customer.all
  end

  # def guest_sign_in
  #   guest = User.find_or_create_by!(email: 'guest@example.com') do |user|
  #     guest.password = SecureRandom.urlsafe_base64
  #     # user.skip_confirmation!  # Confirmable を使用している場合は必要
  #     # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
  #   end
  #   sign_in guest
  #   redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  # end


end
