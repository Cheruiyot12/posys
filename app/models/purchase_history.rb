class PurchaseHistory < ActiveRecord::Base

 belongs_to :supplier
 belongs_to :stock
 belongs_to :type
 belongs_to :brand
 PAYMENT = ["CASH", "CREDIT"]
 

 after_save :save_to_stock
 before_save :calculate_stock



  private

    def calculate_stock
      if self.payment == "CREDIT"

         @get_supplier = Supplier.select('id').where(:id => self.supplier_id).first
         @get_debit = Supplier.select('debit').where(:id => self.supplier_id).first
         @get_supplier.update(:debit => @get_debit.debit.to_i+self.total_cash.to_i)
                    
      end
    end
   
    def save_to_stock

        if !self.new_purchase_item.nil?
          begin
            type_id = self.type_id
            item_price = self.item_price
            number_of_item = self.count
            new_item = self.new_purchase_item 
            stock = Stock.create(:brand =>  new_item, :type_id => type_id,:number_of_item => number_of_item)
          rescue
              
          end
        end


        if !self.purchase_item.nil?
           begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item).first
          
           type_id = self.type_id
           item_price = self.item_price
           number_of_item = self.count
           old_item = self.purchase_item 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                    )
           
          rescue
              
          end
        end

       if !self.purchase_item1.nil?
           begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item1).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item1).first
          
     
           type_id = self.type1
           item_price = self.item_price1
           number_of_item = self.count1
           old_item = self.purchase_item1 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                    )
          rescue
              
          end
        end


        if !self.purchase_item2.nil?
           begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item2).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item2).first
          
     
           type_id = self.type1
           item_price = self.item_price2
           number_of_item = self.count2
           old_item = self.purchase_item2 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end



        if !self.purchase_item3.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item3).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item3).first
          
     
           type_id = self.type3
           item_price = self.item_price3
           number_of_item = self.count3
           old_item = self.purchase_item3 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end


        if !self.purchase_item4.nil?
            begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item4).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item4).first
          
     
           type_id = self.type4
           item_price = self.item_price4
           number_of_item = self.count4
           old_item = self.purchase_item4 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end


        if !self.purchase_item5.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item5).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item5).first
          
     
           type_id = self.type5
           item_price = self.item_price5
           number_of_item = self.count5
           old_item = self.purchase_item5 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end

        if !self.purchase_item6.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item6).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item6).first
          
     
           type_id = self.type6
           item_price = self.item_price6
           number_of_item = self.count6
           old_item = self.purchase_item6 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end

        if !self.purchase_item7.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item7).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item7).first
          
     
           type_id = self.type7
           item_price = self.item_price7
           number_of_item = self.count7
           old_item = self.purchase_item7 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end

        if !self.purchase_item8.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item8).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item8).first
          
     
           type_id = self.type8
           item_price = self.item_price8
           number_of_item = self.count8
           old_item = self.purchase_item8 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end

        if !self.purchase_item9.nil?
          begin
           @my_stock = Stock.select('number_of_item').where(:brand => self.purchase_item9).first
           @my_id = Stock.select('id').where(:brand => self.purchase_item9).first
          
     
           type_id = self.type9
           item_price = self.item_price9
           number_of_item = self.count9
           old_item = self.purchase_item9 
           @all_stock = Stock.find(@my_id.id)
           @all_stock.update(
                    :brand =>  old_item,  
                    :type_id => type_id, 
                    :number_of_item => number_of_item.to_i+@my_stock.number_of_item.to_i
                             )
          rescue
              
          end
        end


       
    end



end