class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  layout :layout_per_action
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
    @customers = Customer.all
  end



  def sale_history
    # @invoices = Invoice.where.not(:payment_type => nil)

    @invoices = Invoice.all  
    @invoice_numbers = @invoices.group_by { |t| t.invoice_number }

  end

  def sale_invoice

    @invoices = Invoice.all  
    @invoice_numbers = @invoices.group_by { |t| t.invoice_number }   

  end

  def sale_report

    if params[:thismonth]
        @invoices = Invoice.where("thismonth = ? ", params[:thismonth])
        @invoice_numbers = @invoices.group_by { |t| t.invoice_number } 
    else
       @invoices = Invoice.all
       @invoice_numbers = @invoices.group_by { |t| t.invoice_number } 
    end
    
  end

  def today_sale
      @invoices = Invoice.where("created_at >= ?", Time.zone.now.beginning_of_day)
      @invoice_numbers = @invoices.group_by { |t| t.invoice_number }

  end

  def line_chart

  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end



  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      @invoice.thismonth = Date.today.strftime("%B")
      if @invoice.save
         @invoices = Invoice.find(:all, :conditions => [ "invoice_number = ''"])
         @invoices.each { |o| o.destroy }



        format.html { redirect_to sales_path, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:thismonth, :count, :invoice_status, :invoice_number, :customer_name, :phone_number, :payment_type, :purchase_item, :sale_id, :item_price)
    end


    def layout_per_action
      if action_name == "customer_notification"
        false
      else
        "application"
      end
    end
end
