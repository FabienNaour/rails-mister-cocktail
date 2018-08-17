class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save # => false
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
 #   @dose = Dose.new
 #   @ingredient = Ingredient.new
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
    def cocktail_params
      # *Strong params*: You need to *whitelist* what can be updated by the user
      # Never trust user data!
      params.require(:cocktail).permit(:name, :photo)
    end

end
