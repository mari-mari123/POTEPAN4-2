class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :icon
  has_many :rooms
  has_many :reservations

  validates :name, presence: true
  validates :introduction, length:{maximum: 30}
  
  mount_uploader :icon, ImageUploader
end
