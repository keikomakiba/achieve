require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user
end
