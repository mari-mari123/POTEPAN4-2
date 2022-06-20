class Room < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :reservations

  validates :user_id, :name, :introduction, :price, :address, :image, presence: true
end
