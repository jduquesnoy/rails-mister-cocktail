class DosesController < ApplicationController
#   def destroy
#   end

#   def new
  
#   end

#   def create
#   end
# end

before_action :set_garden, only: :create
before_action :set_dose, only: :destroy

def create
  @dose = Dose.new(dose_params)
  @dose.cocktail = @cocktail

  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render 'cocktails/show'
  end
end

def destroy
  cocktail = @dose.cocktail
  @dose.destroy

  redirect_to cocktail_path(cocktail)
end

private

def set_dose
  @dose = Dose.find(params[:id])
end

def set_cocktail
  @cocktail = cocktail.find(params[:cocktail_id])
end

def dose_params
  params.require(:dose).permit(:description)
end
end
