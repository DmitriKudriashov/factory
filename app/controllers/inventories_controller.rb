class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    totaling
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show

  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
    @inventory.quantity = 0
    @inventory.budgetitem_id = 1
    @inventory.description_id = 1
    @inventory.brand_id = 1
    @inventory.serial_number = '' 
    @inventory.supplier_id = 1
    @inventory.price_curry =0 
    @inventory.sum_curry = 0
    @inventory.price_usd =0 
    @inventory.sum_usd = 0
 #   @inventory.ratecurry_id = 
 #   @inventory.currency_id = 
    @inventory.unit_id = 1
    @inventory.date_investment = Date.today()
    @inventory.usingtype_id = 1

  end

  # GET /inventories/1/edit
  def edit
    @message = 'Message: EDIT '
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      cals_summs
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    @message = 'Message: UPDATE '
    respond_to do |format|

      if @inventory.update(inventory_params)

        cals_summs

        @message = '!!!!!!   UPDATED !!!!!! '
        format.html { redirect_to @inventory, notice: '!!!! Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    f_respond_destroy(@inventory.destroy, @inventory.id.to_s, inventories_url)
#
#    @inventory.destroy
#    respond_to do |format|
#      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end
 
  def calc_rate_curry
    @inventory.ratecurry_id = f_find_ratecurry_id(@inventory.currency_id, @inventory.date_investment)
     rt = Ratecurry.all.where(id: @inventory.ratecurry_id).order(date_rate: :desc).first.rate
    if rt > 0
      @message = 'Message rt = '+ rt.to_s
     # @inventory.price_usd = @inventory.price_curry / rt
    else
      rt = 1000000
    end
    return rt
  end

   def cals_summs
     if @inventory.price_curry.nil? or @inventory.price_curry == 0
       pcurry = 0
       @inventory.currency_id = 1
       @inventory.price_curry = 0
     else 
       pcurry = @inventory.price_curry
       @inventory.currency_id = 2
     end
    
     if @inventory.price_usd.nil? or @inventory.price_usd == 0
       pusd = 0
       @inventory.price_usd = 0
     else
       pusd = @inventory.price_usd
       @inventory.currency_id = 1
      end
    #-----------------> курс валюты здесь вычислять не нужно, т.к. здесь одно из двух, либо гривна либо доллары
    #   rt = 1
    #  if pcurry>0
    #   rt = calc_rate_curry    
    #  end
    #   pusd = pcurry/rt
    #----------------->
      
     if @inventory.quantity.nil? 
       qtty = 0
       @inventory.quantity = 0
     else
       qtty = @inventory.quantity
     end

     @inventory.sum_curry = pcurry * qtty
     @inventory.sum_usd   = pusd * qtty
     @inventory.save
     totaling 
 
   end

   def totaling   
     act_inventory_all
     @total_usd = @inventories.sum(:sum_usd)
     @total_uah = @inventories.sum(:sum_curry)
     
   end


    def act_inventory_all
      @inventories = Inventory.all.order(date_investment: :desc)
    end

  private

  # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:quantity, :budgetitem_id, :description_id, :brand_id, :serial_number, 
        :supplier_id, :price_curry, :sum_curry, :price_usd, :sum_usd, :ratecurry_id, :currency_id, :unit_id, 
        :date_investment, :usingtype_id)
      
    end
end
