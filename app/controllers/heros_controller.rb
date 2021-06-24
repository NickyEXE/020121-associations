class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :destroy]

  def index
    @heros = Hero.all
  end

  def show
  end

  def new
    @hero = Hero.new
    3.times{ @hero.villains.build }
  end

  def create
    @hero = Hero.new(hero_params)
    if @hero.save
      redirect_to heros_path
    else
      3.times{ @hero.villains.build }
      render :new
    end
  end

  def destroy
    @hero.destroy
    redirect_to heros_path
  end

  private

  def set_hero
    @hero = Hero.find(params[:id])
  end

  def hero_params
    params.require(:hero).permit(:name, :power, villains_attributes: [:name, :power, :power_level, :squad_id])
  end

end
