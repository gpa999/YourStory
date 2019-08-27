class DeleteUserIdRateIdUniqIndexFromComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.remove_index column: [:user_id, :rate_id], unique: true
    end
  end
end
