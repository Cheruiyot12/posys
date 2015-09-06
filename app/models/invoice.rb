class Invoice < ActiveRecord::Base

	PAYMENT = ["CASH", "DEBIT"]

  # after_create :remove_form_sale

   
  #  def remove_form_sale
  #  		# remove data every mid night
  #     if self.payment_type.nil?  	
  #         Invoice.all.each do |invoice|
  #           	invoice.destroy
  #       	end
  #     end 
  #   end

end





# 