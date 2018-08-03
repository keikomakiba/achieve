require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  belongs_to :user
belongs_to :blog
end
