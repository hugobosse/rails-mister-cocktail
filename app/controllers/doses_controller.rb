class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @doses = @cocktail.doses
    if @dose.save
      redirect_to cocktail_path
    else
      render 'cocktails/show'
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
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description)
    end
end
