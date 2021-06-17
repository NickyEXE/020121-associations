class VillainsController < ApplicationController
  before_action :set_villain, only: [:show, :edit, :update, :destroy]

  # get "/villains"
  def index
    @villains = Villain.all
    render :index
  end

  def show
    render :show
  end

  # get "/villains/new"
  def new
    @villain = Villain.new
    render :new
  end

  # post "/villains"
  def create
    # @villain = Villain.create(villain_params)
    #   if @villain.valid?
    @villain = Villain.new(villain_params)
      if @villain.save
        redirect_to @villain
      else
        render :new
      end
  end

  # get "/villains/:id/edit"
  def edit
    render :edit
  end

  def update
    if @villain.update(villain_params)
      redirect_to @villain
    else
      render :edit
    end
  end

  def destroy
    @villain.destroy
    # add something here
    redirect_to villains_path
  end

  private

  def set_villain
    @villain = Villain.find(params[:id])
  end

  def villain_params
    params.require(:villain).permit(:name, :power, :adversary, :power_level)
  end

end
