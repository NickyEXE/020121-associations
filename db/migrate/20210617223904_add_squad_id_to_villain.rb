class AddSquadIdToVillain < ActiveRecord::Migration[6.1]
  def change
    add_reference :villains, :squad, foreign_key: true
  end
end
