class AddColumnTwitter < ActiveRecord::Migration[5.1]
  def change
    create_table :twitter do |t|
      t.text :image

      t.timestamps
    end
  end
end
