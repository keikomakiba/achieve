class CreateTwitters < ActiveRecord::Migration[5.1]
  def change
    create_table :twitters do |t|
      t.string :title
      t.text :content
    end
  end
end
