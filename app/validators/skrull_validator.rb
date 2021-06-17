class SkrullValidator < ActiveModel::Validator
  def validate(record)
    if record.name.downcase.include?("skrull")
      record.errors.add :base, "No Skrulls in the Legion of Doom"
    end
  end
end
