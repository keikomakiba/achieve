class AddColumnsToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :twitter_id, :integer
  end
end
