class UsingtypesController < ApplicationController
  before_action :set_usingtype, only: [:show, :edit, :update, :destroy]

  # GET /usingtypes
  # GET /usingtypes.json
  def index
    @usingtypes = Usingtype.all
  end

  # GET /usingtypes/1
  # GET /usingtypes/1.json
  def show
  end

  # GET /usingtypes/new
  def new
    @usingtype = Usingtype.new
  end

  # GET /usingtypes/1/edit
  def edit
  end


  # POST /usingtypes
  # POST /usingtypes.json
  def create
    @usingtype = Usingtype.new(usingtype_params)

    respond_to do |format|
      if @usingtype.save
        format.html { redirect_to @usingtype, notice: 'Usingtype was successfully created.' }
        format.json { render :show, status: :created, location: @usingtype }
      else
        format.html { render :new }
        format.json { render json: @usingtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usingtypes/1
  # PATCH/PUT /usingtypes/1.json
  def update
    respond_to do |format|
      if @usingtype.update(usingtype_params)
        format.html { redirect_to @usingtype, notice: 'Usingtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @usingtype }
      else
        format.html { render :edit }
        format.json { render json: @usingtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usingtypes/1
  # DELETE /usingtypes/1.json
  def destroy
    f_respond_destroy(@usingtype.destroy, @usingtype.name, usingtypes_url)
#
#    @usingtype.destroy
#    respond_to do |format|
#     format.html { redirect_to usingtypes_url, notice: 'Usingtype was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usingtype
      @usingtype = Usingtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usingtype_params
      # kds params.fetch(:usingtype, {})
      params.require(:usingtype).permit(:name)
   end
end
