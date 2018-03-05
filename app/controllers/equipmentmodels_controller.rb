class EquipmentmodelsController < ApplicationController
  before_action :set_equipmentmodel, only: [:show, :edit, :update, :destroy]
    
  # GET /equipmentmodels
  # GET /equipmentmodels.json
  def index
    @equipmentmodels = Equipmentmodel.all.order(:name)
  end

  # GET /equipmentmodels/1
  # GET /equipmentmodels/1.json
  def show
  end

  # GET /equipmentmodels/new
  def new
    @equipmentmodel = Equipmentmodel.new
    @equipmentmodel.brand_id = 1
  end

  # GET /equipmentmodels/1/edit
  def edit
  end

  # POST /equipmentmodels
  # POST /equipmentmodels.json
  def create
    @equipmentmodel = Equipmentmodel.new(equipmentmodel_params)

    respond_to do |format|
      if @equipmentmodel.save
        format.html { redirect_to @equipmentmodel, notice: 'Equipment model was successfully created.' }
        format.json { render :show, status: :created, location: @equipmentmodel}
      else
        format.html { render :new }
        format.json { render json: @equipmentmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipmentmodels/1
  # PATCH/PUT /equipmentmodels/1.json
  def update
    respond_to do |format|
      if @equipmentmodel.update(equipment_params)
        format.html { redirect_to @equipmentmodel, notice: 'Equipment model was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipmentmodel }
      else
        format.html { render :edit }
        format.json { render json: @equipmentmodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipmentmodels/1
  # DELETE /equipmentmodels/1.json
  def destroy
          f_respond_destroy(@equipmentmodel.destroy, @equipmentmodel.name, equipmentmodels_url)
   
 #   @equipmentmodel.destroy
 #   respond_to do |format|
 #     format.html { redirect_to equipment_index_url, notice: 'equipmentmodel was successfully destroyed.' }
 #     format.json { head :no_content }
 #   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipmentmodel
      @equipmentmodel = Equipmentmodel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipmentmodel_params
      params.require(:equipmentmodel).permit(:name, :brand_id)
    end
end
