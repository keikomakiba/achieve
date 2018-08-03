class Blog < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    
    validates :title, presence: true
    validates :content, length:{in:1..140}
end