class ChangeDateTextToPosts < ActiveRecord::Migration[5.2]
  def change
   change_column :posts, :text, :text, :limit => 4294967295
  end
end
