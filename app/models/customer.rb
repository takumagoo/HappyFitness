class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum sex: { man: 0, woman: 1 }

  has_one_attached :profile_image
  
  #新規会員登録及び会員編集バリデーション
  validates :age, numericality: { only_integer: true }

  # QRコードの名前の関する情報
  def full_name
    last_name + first_name
  end

  # 画像の有無判定
  def get_profile_image(width, height, center)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = 'ゲスト'
      customer.first_name = '会員'
    end
  end

end
