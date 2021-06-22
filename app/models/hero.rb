class Hero < ApplicationRecord

  has_many :villains, dependent: :nullify
  # dependent: :nullify makes the villain have no hero_id when the hero gets destroyed
  # dependent: :destroy destroys any villain that has a matching hero ID when the hero gets destroyed
  before_validation :set_power
  validates_with SkrullValidator
  accepts_nested_attributes_for :villains, reject_if: proc{|attr| attr['name'].blank?}


  private

  def set_power
    if self.power.blank?
      self.power = Faker::Superhero.power
    end
  end

end
