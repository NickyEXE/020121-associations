class Villain < ApplicationRecord
  belongs_to :squad, optional: true
  belongs_to :adversary, class_name: "Hero", foreign_key: "hero_id", optional: true

  # validates uses rails' built in validators, or validators you've added to rails
  validates :name, :power, :power_level, presence: true
  validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
  # validate is used for building out custom validations
  # validates_with is used for building out validations that you want to share between models
  validate :ban_deadpool
  validates_with SkrullValidator
  before_validation :set_power
  # before_create :set_power -- happens after validation and not on update actions
  # before_save :set_power -- happens after validation

  scope :stronger_than, ->(strength){ where("power_level > ?", strength) }

  #
  # same thing as:
  # def self.stronger_than(strength)
  #   where("power_level > ?", strength)
  # end

  def adversary_name
    adversary ? adversary.name : ""
  end

  def adversary_name=(a_name)
    self.adversary = Hero.find_or_create_by(name: a_name)
  end

  private

  def set_power
    if self.power.blank?
      self.power = Faker::Superhero.power
    end
  end

  def ban_deadpool
    if self.name.downcase.include?("deadpool")
      self.errors.add(:name, "must not be Deadpool, who is banned from this app.")
    end
  end

end
