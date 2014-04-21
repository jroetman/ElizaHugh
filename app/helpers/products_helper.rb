

module ProductsHelper
  include ActiveMerchant::Shipping
  
  def getTax
      p = PaymentInfo.first
      p.tax
  end
  
  def getShipping
      p = PaymentInfo.first
      p.shipping
  end
  
 def upsShippingCosts(products)
      packages = [
          Package.new(  100,                        # 100 grams
                    [93,10],                    # 93 cm long, 10 cm diameter
                    :cylinder => true),         # cylinders have different volume calculations
     
          Package.new(  (7.5 * 16),              # 7.5 lbs, times 16 oz/lb.
                     [15, 10, 4.5],              # 15x10x4.5 inches
                     :units => :imperial)        # not grams, not centimetres
       ]
      
      # You live in Beverly Hills, he lives in Ottawa
		origin = Location.new(      :country => 'US',
		                            :state => 'ME',
		                            :city => 'Bridgton',
		                            :zip => '04009')
		
	 	destination = Location.new( :country => 'US',
	 	                            :state   => 'CA',
	 	                            :city    => 'Seaside',
	 	                            :zip     => '93955')
	 	                            
	   
	    ups = UPS.new(:login => 'jroetman', :password => 'jr7573717!', :key => 'ECD058ADAE548E46')
             response = ups.find_rates(origin, destination, packages)
             
        response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}.to_json
		
  end  
  

end
