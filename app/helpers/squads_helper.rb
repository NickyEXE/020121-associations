module SquadsHelper

  def squad(villain)
    if villain.squad
      render partial: "squads/squad", locals: {squad: villain.squad}
    else
      link_to "Edit #{villain.name} to add a Squad!", edit_villain_path(villain)
    end
  end

end
