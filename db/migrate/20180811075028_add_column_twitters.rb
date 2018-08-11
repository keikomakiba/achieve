class AddColumnTwitters < ActiveRecord::Migration[5.1]
  def change
    add_column :twitters, :image, :string
  end
end
