module SquadsHelper

  def squad(villain)
    if villain.squad
      villain.squad.name
    else
      link_to "Edit #{villain.name} to add a Squad!", edit_villain_path(villain)
    end
  end

end
