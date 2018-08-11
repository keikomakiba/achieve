class User < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  
  before_validation { email.downcase! }
  has_secure_password
  has_many :favorites, dependent: :destroy
  has_many :favorite_twitters, through: :favorites, source: :twitter
  
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :image, presence: true
end

