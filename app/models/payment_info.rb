class PaymentInfo < ActiveRecord::Base
    self.table_name = "payment_info"	
    
    def self.shippingCost(total)
        #Shipments to 48 states by UPS Ground
		#up to $15.00                 $6.00
		#up to $15.01 to $25.00       $7.00
		#up to $25.01 to $45.00       $8.00
		#up to $45.01 to $65.00       $11.00
		#up to $65.00 to $90.00       $14.00
		#over $90.01                       $17.95

		if total == 0.0
		   res = 0.0
		   
	    elsif total <= 15.0
		   res = 6.0
		   
	    elsif total > 15.0 && total <= 25.0
	       res = 7.0
	       
	    elsif total > 25.0 && total <= 45.0
	       res = 8.0
	    
	    elsif total > 45.0 && total <= 65.0
	       res = 11.0
	       
	    elsif total > 65.0 && total <= 90.0
	       res = 14.0
	    
	    else
	       res = 17.95
	    
	    end
	    
    end

end
