class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      raise
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    redirect_to cocktail_path(params[:cocktail_id]) if @dose.destroy
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
