class Villain < ApplicationRecord

  # validates uses rails' built in validators, or validators you've added to rails
  validates :name, :power, :adversary, :power_level, presence: true
  validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  # validate is used for building out custom validations
  # validates_with is used for building out validations that you want to share between models
  validate :ban_deadpool
  validates_with SkrullValidator


  private

  def ban_deadpool
    if self.name.downcase.include?("deadpool")
      self.errors.add(:name, "must not be Deadpool, who is banned from this app.")
    end
  end

end
