class SquadsController < ApplicationController

  def index
    @squads = Squad.all
  end

end
