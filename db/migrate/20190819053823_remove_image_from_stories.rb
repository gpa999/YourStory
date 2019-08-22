class RemoveImageFromStories < ActiveRecord::Migration[5.2]
  def change
    remove_column :stories, :image, :text
  end
end
