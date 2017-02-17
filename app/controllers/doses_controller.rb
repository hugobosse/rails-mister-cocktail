class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :create]


  def show
  end

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new()
  end

  def edit
  end


  def create
    @doses = @cocktail.doses
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  def update
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
