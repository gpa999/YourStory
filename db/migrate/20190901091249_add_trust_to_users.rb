class AddTrustToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :trust, :float
  end
end
