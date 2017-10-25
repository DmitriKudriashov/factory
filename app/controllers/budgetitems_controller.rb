class BudgetitemsController < ApplicationController
  before_action :set_budgetitem, only: [:show, :edit, :update, :destroy]

  # GET /budgetitems
  # GET /budgetitems.json
  def index
    @budgetitems = Budgetitem.all
  end

  # GET /budgetitems/1
  # GET /budgetitems/1.json
  def show
  end

  # GET /budgetitems/new
  def new
    @budgetitem = Budgetitem.new
  end

  # GET /budgetitems/1/edit
  def edit
  end

  # POST /budgetitems
  # POST /budgetitems.json
  def create
    @budgetitem = Budgetitem.new(budgetitem_params)

    respond_to do |format|
      if @budgetitem.save
        format.html { redirect_to @budgetitem, notice: 'Budgetitem was successfully created.' }
        format.json { render :show, status: :created, location: @budgetitem }
      else
        format.html { render :new }
        format.json { render json: @budgetitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /budgetitems/1
  # PATCH/PUT /budgetitems/1.json
  def update
    respond_to do |format|
      if @budgetitem.update(budgetitem_params)
        format.html { redirect_to @budgetitem, notice: 'Budgetitem was successfully updated.' }
        format.json { render :show, status: :ok, location: @budgetitem }
      else
        format.html { render :edit }
        format.json { render json: @budgetitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgetitems/1
  # DELETE /budgetitems/1.json
  def destroy
    @budgetitem.destroy
    respond_to do |format|
      format.html { redirect_to budgetitems_url, notice: 'Budgetitem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budgetitem
      @budgetitem = Budgetitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budgetitem_params
      params.require(:budgetitem).permit(:BudgetItemName, :CodeItem)
    end
end
