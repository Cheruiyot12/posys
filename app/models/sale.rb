class Sale < ActiveRecord::Base
	SALE_METHOD = ["WholeSale", "Retail"]
	SALE_NAME = ["Table1", "Table2", "Table3", "Table4", "Table5"]
	belongs_to :customer
end
