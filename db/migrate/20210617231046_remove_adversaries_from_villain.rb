class RemoveAdversariesFromVillain < ActiveRecord::Migration[6.1]
  def change
    remove_column :villains, :adversary, :string
  end
end
