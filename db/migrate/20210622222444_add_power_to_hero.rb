class AddPowerToHero < ActiveRecord::Migration[6.1]
  def change
    add_column :heros, :power, :string
  end
end
