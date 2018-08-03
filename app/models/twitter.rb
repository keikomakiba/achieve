class Twitter < ApplicationRecord
    validates :content, length:{in:1..140}
    belongs_to :user
    has_many :favorites
    has_many :favoriting_users, through: :favorites, source: :user
end