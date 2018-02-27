class CashesController < ApplicationController

  before_action :set_cash, only: [:show, :edit, :update, :destroy]

  # GET /cashes
  # GET /cashes.json
  def index
    cash_totaling
  end

  # GET /cashes/1
  # GET /cashes/1.json
  def show
      mess_and_style(@cash.sum_curry, @cash.sum_usd, @cash.cash_date)
  end

  # GET /cashes/new
  def new
    @cash = Cash.new
    @cash.cash_date =  Date.today()
    @cash.currency_id = 1 
    @cash.ratecurry_id = 1 
    @cash.sum_curry =  0
    @cash.sum_usd =  0
    @cash.budgetitem_id = 1
  end

  # GET /cashes/1/edit
  def edit
  end

  # POST /cashes
  # POST /cashes.json

  def create
    @cash = Cash.new(cash_params)

    respond_to do |format|
        @cash.sum_usd = f_calc_sum_usd(@cash.currency_id, @cash.cash_date, @cash.sum_curry) 
     if @cash.save
        format.html { redirect_to @cash, notice: 'Cash was successfully created.' }
        format.json { render :show, status: :created, location: @cash }

      else
        format.html { render :new }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /cashes/1
  # PATCH/PUT /cashes/1.json
  def update
     
    respond_to do |format|
      if @cash.update(cash_params)
        @cash.sum_usd = f_calc_sum_usd(@cash.currency_id, @cash.cash_date, @cash.sum_curry) 
        @cash.update({:sum_usd => @cash.sum_usd })
        format.html { redirect_to @cash, notice: 'Cash was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash }
      else
        format.html { render :edit }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.json
  def destroy
      f_respond_destroy(@cash.destroy, @cash.id.to_s, cashes_url )
#  @cash.destroy
#    respond_to do |format|
#      format.html { redirect_to cashes_url, notice: 'Cash was successfully destroyed.' }
#      format.json { head :no_content }
#    end
  end


  def cash_totaling   
     cash_all      
     @cash_total_usd = @cashes.sum(:sum_usd)
     # валюты смешанные считать сумму бессмысленно @cash_total_uah = @cashes.sum(:sum_curry)
  end
  
  def cash_all
      @cashes = Cash.all.order(cash_date: :desc)
  end
 
  def mess_and_style(sum_curry, sum_usd, dt)
       @style_color = ''  
       @mess_not_rate = '' 
      if not (sum_curry == 0 ) and sum_usd == 0  
         @style_color =  'color: yellow; background-color: red; font-weight: bolder;'  
         @mess_not_rate = ' !!! Rate UAH Not found by date: '+dt.strftime("%d.%m.%Y") 
      end 
       return @style_color
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash
      @cash = Cash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_params
        params.require(:cash).permit(:cash_date, :currency_id,  :sum_curry, :sum_usd, :account_id)
      # 170118 params.fetch(:cash, {:cash_date, :currency_id, :ratecurry_id, :sum_curry, :sum_usd, :budgetsitem_id})
    end


end
