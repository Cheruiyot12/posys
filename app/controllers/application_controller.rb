class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :cutomer_notification

  private
  def cutomer_notification
  	@previous_month = Time.now.months_since(-2).strftime("%B")

  	# pee kat tat month mhar shi khat tal customer tway
    @customers = Invoice.where(:thismonth => @previous_month)
    # nit la twuin mhar shi khat tat customer tway
    @ranges = Invoice.where(created_at: (Time.now.months_since(-1))..Time.now).pluck(:customer_name)

    @noti_invoices = @customers.where.not({ customer_name: @ranges})

    @noti_stocks = Stock.where("number_of_item < ?", 10)

    @num_stocks = Stock.where("number_of_item < ?", 10).count

  end
  
end
