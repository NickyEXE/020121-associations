module VillainsHelper

  def pluralize(number_of_items, item)
    if number_of_items > 1
      "#{number_of_items} #{item.pluralize}"
    else
      "#{number_of_items} #{item}"
    end
  end
end
