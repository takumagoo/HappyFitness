class Menu < ApplicationRecord
  belongs_to :genre
  
  validates :name, presence: true
  validates :explanation, presence: true
  
end
