class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  layout :layout_per_action
  # GET /sales
  # GET /sales.json


  def sale_force

    if params[:brand]
        @my_types = Stock.all.where("type_id = ? ", params[:type_id])
        @stocks = @my_types.group(:brand)
    else
        @stocks = Stock.all.order("created_at ASC").group(:brand)
    end

    @sale = Sale.new
    @customers = Customer.all
    @customer = Customer.new
  end

  def sale_force_by_type
    @stocks = Stock.all.order("created_at ASC").group(:type_id)
  end

  # def sale_force_by_brand

  #   if params[:type_id]
  #       @my_types = Stock.all.where("type_id = ? ", params[:type_id])
  #       @stocks = @my_types.group(:brand)
  #   else 
  #     @stocks = Stock.all.order("created_at ASC").group(:brand)
  #   end

  # end

  def invoice_print
    @sales = Sale.all
    
    @previous_month = Time.now.months_since(-2).strftime("%B")

    # pee kat tat month mhar shi khat tal customer tway
    @mycustomers = Invoice.where(:thismonth => @previous_month)
    # nit la twuin mhar shi khat tat customer tway
    @ranges = Invoice.where(created_at: (Time.now.months_since(-1))..Time.now).pluck(:customer_name)

    @noti_invoices = @mycustomers.where.not({ customer_name: @ranges})

    @customers = Customer.all
    @invoices = Invoice.where(:invoice_status => "aok").where(:payment_type => nil)
  end

  def check_in_stock
    respond_to do |format|
      @sale = Sale.find(params[:id])
      if @sale.update(:status => "confirm")

        @chosen_item = Stock.where(brand: @sale.name)
        @number_of_item = Stock.find(@chosen_item)

        if @number_of_item.number_of_item > @sale.count
          @calculate =  @number_of_item.number_of_item - @sale.count
          Stock.find(@chosen_item).update(:number_of_item => @calculate)
        else
           flash[:notice] = "Out of Stock!!!"
           @sale.update(:status => "unconfirm")
        end
        format.html { redirect_to sales_path }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end


   def readd_in_stock
    respond_to do |format|
      @sale = Sale.find(params[:id])
      if @sale.update(:status => "unconfirm")

        @chosen_item = Stock.where(brand: @sale.name)
        @number_of_item = Stock.find(@chosen_item)
        @calculate =  @number_of_item.number_of_item + @sale.count
        Stock.find(@chosen_item).update(:number_of_item => @calculate)

        format.html { redirect_to sales_path }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end



  def index
    @sales = Sale.all
    
    @previous_month = Time.now.months_since(-2).strftime("%B")

    # pee kat tat month mhar shi khat tal customer tway
    @mycustomers = Invoice.where(:thismonth => @previous_month)
    # nit la twuin mhar shi khat tat customer tway
    @ranges = Invoice.where(created_at: (Time.now.months_since(-1))..Time.now).pluck(:customer_name)

    @noti_invoices = @mycustomers.where.not({ customer_name: @ranges})

    @invoice = Invoice.new
    @customers = Customer.all
    @invoices = Invoice.where(:invoice_status => "aok").where(:payment_type => nil)
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new

    @customer = Customer.all()
    @customer_list=[]
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_force_by_type_path, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:name, :count, :status, :check, :item_price, :sale_method, :sale_name, :customer_id)
    end

    def layout_per_action
      if action_name == "index"
        "application"
      else
        "mobile"
      end
    end

end
