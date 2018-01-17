class ModelsetsController < ApplicationController
  before_action :set_modelset, only: [:show, :edit, :update, :destroy]

  # GET /modelsets
  # GET /modelsets.json
  def index
    @modelsets = Modelset.all.order(date_model: :desc)
  end

  # GET /modelsets/1
  # GET /modelsets/1.json
  def show
  end

  # GET /modelsets/new
  def new
    @modelset = Modelset.new
  end

  # GET /modelsets/1/edit
  def edit
  end

  # POST /modelsets
  # POST /modelsets.json
  def create
    @modelset = Modelset.new(modelset_params)

    respond_to do |format|
      if @modelset.save
        format.html { redirect_to @modelset, notice: 'Modelset was successfully created.' }
        format.json { render :show, status: :created, location: @modelset }
      else
        format.html { render :new }
        format.json { render json: @modelset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelsets/1
  # PATCH/PUT /modelsets/1.json
  def update
    respond_to do |format|
      if @modelset.update(modelset_params)
        format.html { redirect_to @modelset, notice: 'Modelset was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelset }
      else
        format.html { render :edit }
        format.json { render json: @modelset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelsets/1
  # DELETE /modelsets/1.json
  def destroy
    f_respond_destroy(@modelset.destroy, @modelset.number_model, modelsets_url )

#    @modelset.destroy
#    respond_to do |format|
#      format.html { redirect_to modelsets_url, notice: 'Modelset was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelset
      @modelset = Modelset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelset_params
      params.require(:modelset).permit(:number_model, :date_model, :product_id)
    end
end
