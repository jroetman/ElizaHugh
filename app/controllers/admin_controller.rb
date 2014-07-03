class AdminController < ApplicationController
  before_action :require_admin
  
  def index
  end
  
  def specials
    @specials = Special.all.order(:id)
    render :partial => "specials", :layout => false, :locals =>{:specials =>@specials}
    
  end
  
  def products
    @products = Product.all.map
    @product = Product.new
    render :partial => "products", :layout => false, :locals => {:products => @products}
    
  end
  
    
  def paymentSettings
    @settings = PaymentInfo.select("payment_info.*").from("payment_info")
    if (!@settings.any?) 
      @settings = [PaymentInfo.new]
    end
    
    render :partial => "paymentSettings", :layout => false
    
  end
  
  def updatePaymentInfo	
    pi = PaymentInfo.new(params[:payment_info].permit(:vendor, :id, :tax, :shipping))
    pi.save()
   
    @settings = PaymentInfo.select("payment_info.*").from("payment_info")
     
    respond_to do |format|
      format.json {render :json => { :message => "success"}}
    end
  
  end
  
  def addProductRemote
	    @product = Product.new
	    @cateogires = Category.all
	    
	    render :layout => false     
  end
  
end
