class ModelpricesController < ApplicationController
  before_action :set_modelprice, only: [:show, :edit, :update, :destroy]

  # GET /modelprices
  # GET /modelprices.json
  def index
    @modelprices = Modelprice.all.order(:id)
  end

  # GET /modelprices/1
  # GET /modelprices/1.json
  def show
  end

  # GET /modelprices/new
  def new
    @modelprice = Modelprice.new
  end

  # GET /modelprices/1/edit
  def edit
  end

  # POST /modelprices
  # POST /modelprices.json
  def create
    @modelprice = Modelprice.new(modelprice_params)

    respond_to do |format|
      if @modelprice.save
        format.html { redirect_to @modelprice, notice: 'Modelprice was successfully created.' }
        format.json { render :show, status: :created, location: @modelprice }
      else
        format.html { render :new }
        format.json { render json: @modelprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelprices/1
  # PATCH/PUT /modelprices/1.json
  def update
    respond_to do |format|
      if @modelprice.update(modelprice_params)
        format.html { redirect_to @modelprice, notice: 'Modelprice was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelprice }
      else
        format.html { render :edit }
        format.json { render json: @modelprice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelprices/1
  # DELETE /modelprices/1.json
  def destroy
    f_respond_destroy(@modelprice.destroy, @modelprice.id.to_s, modelprices_url)


#    @modelprice.destroy
#   respond_to do |format|
#      format.html { redirect_to modelprices_url, notice: 'Modelprice was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelprice
      @modelprice = Modelprice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelprice_params
      params.require(:modelprice).permit(:modelset_id, :category_id, :description_id, :quantty, :unit_id, :unit_price, :currency_id, :ratecurry_id, :sum_curry, :sum_usd)
    end
end
