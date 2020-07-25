class DosesController < ApplicationController
  before_action :find_cocktail, except: [:destroy]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
      if @dose.save
        redirect_to new_cocktail_dose_path(@cocktail)
      else
        render :new
      end

    def destroy
      @dose = Dose.find(params[:id])
      @dose.destroy
      redirect_to cocktail_path(@dose.cocktail)
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
