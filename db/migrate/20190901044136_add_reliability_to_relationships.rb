class AddReliabilityToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :reliability, :integer
  end
end
