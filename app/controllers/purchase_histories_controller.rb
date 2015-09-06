class PurchaseHistoriesController < ApplicationController
  before_action :set_purchase_history, only: [:show, :edit, :update, :destroy]

  # GET /purchase_histories
  # GET /purchase_histories.json
  def get_phone
    @suppliers = Supplier.where(:id  => params[:id]).pluck(:contact)
    render :json => {:contact => @suppliers }
  end

  def get_debit
    @debits = Supplier.where(:id  => params[:id]).pluck(:debit)
    render :json => {:debit => @debits }
  end

  def get_item
    @my_stock = Stock.where(:type_id  => params[:type]).pluck(:brand)
    render :json => {:stock => @my_stock }
  end

  def get_item_name
    @my_stock = Stock.where(:type_id  => params[:type]).pluck(:brand)
    render :json => {:stock => @my_stock }
  end

  def reduce_debit
    @supplier = Supplier.find(params[:name])
    @supplier.update(:debit => @supplier.debit.to_i - params[:debit].to_i)
    @bank = Bank.create(:amount => params[:debit].to_i, :bank_transfer_date => params[:bank_transfer_date], :supplier => @supplier)

  end
  
  def add_new_purchase
    @purchase_history = PurchaseHistory.new

    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end

    @brand = Brand.all()
    @brand_list=[]
    @brand.each do |c|
    @brand_list << [c.name,c.id]
    end

    @type = Type.all()
    @type_list=[]
    @type.each do |c|
    @type_list << [c.name,c.id]
    end

    @type_name = Type.all()
    @type_name_list=[]
    @type_name.each do |c|
    @type_name_list << [c.name,c.name]
    end


    @stock = Stock.all()
    @stock_list=[]
    @stock.each do |c|
    @stock_list << [c.brand,c.brand]
    end

    @suppliers = Supplier.all
  end

  def index
    @mysuppliers = Supplier.all
    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end
    @purchase_histories = PurchaseHistory.all
  end

  def purchase_report

    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end

    if params[:thismonth]
      @purchase_histories = PurchaseHistory.where("thismonth = ? ", params[:thismonth])
    else
      @purchase_histories = PurchaseHistory.all
    end

  end

  def today_purchase
      @purchase_histories = PurchaseHistory.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  # GET /purchase_histories/1
  # GET /purchase_histories/1.json
  def show
  end

  def my_supplier
    @mysuppliers = Supplier.all
    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end
    @supplier_names = Supplier.where("id = ?", params[:supplier])
    @purchase_histories = PurchaseHistory.where("supplier_id = ?", params[:supplier])
    @banks = Bank.where("supplier = ?", params[:supplier])
    @supplier_debits = Supplier.where("id = ?", params[:supplier])
  end

  # GET /purchase_histories/new
  def new
    @purchase_history = PurchaseHistory.new

   

    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end

    @brand = Brand.all()
    @brand_list=[]
    @brand.each do |c|
    @brand_list << [c.name,c.id]
    end

    @type = Type.all()
    @type_list=[]
    @type.each do |c|
    @type_list << [c.name,c.id]
    end

    @type_name = Type.all()
    @type_name_list=[]
    @type_name.each do |c|
    @type_name_list << [c.name,c.id]
    end
    
    @stock = Stock.all()
    @stock_list=[]
    @stock.each do |c|
    @stock_list << [c.brand,c.brand]
    end

    @suppliers = Supplier.all
  end

  # GET /purchase_histories/1/edit
  def edit

    @supplier = Supplier.all()
    @supplier_list=[]
    @supplier.each do |c|
    @supplier_list << [c.name,c.id]
    end
  end

  # POST /purchase_histories
  # POST /purchase_histories.json
  def create
    @purchase_history = PurchaseHistory.new(purchase_history_params)

    respond_to do |format|
      if @purchase_history.save
        format.html { redirect_to @purchase_history, notice: 'Purchase history was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_history }
      else
        format.html { render :new }
        format.json { render json: @purchase_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_histories/1
  # PATCH/PUT /purchase_histories/1.json
  def update
    respond_to do |format|
      if @purchase_history.update(purchase_history_params)
        format.html { redirect_to @purchase_history, notice: 'Purchase history was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_history }
      else
        format.html { render :edit }
        format.json { render json: @purchase_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_histories/1
  # DELETE /purchase_histories/1.json
  def destroy
    @purchase_history.destroy
    respond_to do |format|
      format.html { redirect_to purchase_histories_url, notice: 'Purchase history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_history
      @purchase_history = PurchaseHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_history_params
      params.require(:purchase_history).permit(:stock_arrival_date,:purchase_date,:item_price1,:item_price2,:item_price3,:item_price4,:item_price5,:item_price6,:item_price7,:item_price8,:item_price9,:type9,:type8,:type7,:type6,:type5,:type4,:type3,:type2,:type1,:purchase_item9,:count9,:purchase_item8,:count8,:purchase_item7,:count7,:purchase_item6,:count6,:purchase_item5,:count5,:purchase_item4,:count4,:purchase_item3,:count3,:purchase_item2,:count2,:purchase_item1,:count1,:thismonth,:new_purchase_item,:total_cash,:type_id, :item_price,:supplier_id, :phone, :payment, :purchase_item, :count)
    end
end


