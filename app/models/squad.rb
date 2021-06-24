class Squad < ApplicationRecord
  has_many :villains

  def power_level
    self.villains.sum(:power_level)
  end

  def number_of_villains
    self.villains.count
  end

end
