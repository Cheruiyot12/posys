class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json

  def get_data

    begin
            Stock.delete_all(:type => nil)
             require 'net/http'
             source = 'http://fact.herokuapp.com/products.json'
             resp = Net::HTTP.get_response(URI.parse(source))
             data = resp.body
             result = JSON.parse(data)

              stocks = result.map do |stock|
              u = Stock.new
              u.brand =  stock['name'].to_s
              u.number_of_item = stock['amount'].to_s
              u.fact_type = stock['product_type'].to_s

              u.save
              u
              end
              stocks.select(&:persisted?)
              redirect_to stocks_path
    rescue
              redirect_to stocks_path, :notice => "Connection is bad." 
    end

  end

  
  def index
  
    @stocks_fact = Stock.where(:type => nil )
    @stocks = Stock.where.not(:type => nil)


  end


  def find_stock
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new

    @type = Type.all()
    @type_list=[]
    @type.each do |c|
    @type_list << [c.name,c.id]
    end
  end

  # GET /stocks/1/edit
  def edit

    @type = Type.all()
    @type_list=[]
    @type.each do |c|
    @type_list << [c.name,c.id]
    end
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:purchase_price, :item_price,:fact_type, :brand, :type_id,:number_of_item, :pricing,:wholesale_price)
    end
end
