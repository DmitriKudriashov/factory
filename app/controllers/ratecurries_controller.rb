class RatecurriesController < ApplicationController
  before_action :set_ratecurry, only: [:show, :edit, :update, :destroy]

  # GET /ratecurries
  # GET /ratecurries.json
  def index
    @ratecurries = Ratecurry.all
  end
  def check_act
       'xxxxx'
  end



  # GET /ratecurries/1
  # GET /ratecurries/1.json
  def show
  end

  # GET /ratecurries/new
  def new
    @ratecurry = Ratecurry.new
    @ratecurry.date_rate = Date.today
    #@ratecurry.currency_id = Currency.all[1]
  end

  # GET /ratecurries/1/edit
  def edit
  end

  # POST /ratecurries
  # POST /ratecurries.json
  def create
    @ratecurry = Ratecurry.new(ratecurry_params)

    respond_to do |format|
      if @ratecurry.save
        format.html { redirect_to @ratecurry, notice: 'Ratecurry was successfully created.' }
        format.json { render :show, status: :created, location: @ratecurry }
      else
        format.html { render :new }
        format.json { render json: @ratecurry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratecurries/1
  # PATCH/PUT /ratecurries/1.json
  def update
    respond_to do |format|
      if @ratecurry.update(ratecurry_params)
        format.html { redirect_to @ratecurry, notice: 'Ratecurry was successfully updated.' }
        format.json { render :show, status: :ok, location: @ratecurry }
      else
        format.html { render :edit }
        format.json { render json: @ratecurry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratecurries/1
  # DELETE /ratecurries/1.json
  def destroy
    @ratecurry.destroy
    respond_to do |format|
      format.html { redirect_to ratecurries_url, notice: 'Ratecurry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ratecurry
      @ratecurry = Ratecurry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ratecurry_params
      params.require(:ratecurry).permit(:currency_id, :rate, :date_rate)
    end
end
