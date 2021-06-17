class AddHeroIdsToVillain < ActiveRecord::Migration[6.1]
  def change
    add_reference :villains, :hero, foreign_key: true
  end
end
