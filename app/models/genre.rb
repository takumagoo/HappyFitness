class Genre < ApplicationRecord
  has_many :menus, dependent: :destroy
end
