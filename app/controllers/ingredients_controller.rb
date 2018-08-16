class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save # => false
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

 private
  def dose_params
    params.require(:ingredient).permit(:description, :content)
  end
end

