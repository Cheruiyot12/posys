class Stock < ActiveRecord::Base

	TYPE = ["retail", "wholesale"]

	


    belongs_to :type
    has_many :purchase_histories
end
