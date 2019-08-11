class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :image
      t.text :text

      t.timestamps null: true
    end
  end
end
