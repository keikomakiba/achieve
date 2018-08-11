class Twitter < ApplicationRecord
    mount_uploader :image, ImageUploader
    
    belongs_to :user
    has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
    
    # validates :content, length:{in:1..140}
end