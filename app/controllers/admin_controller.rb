class AdminController < ApplicationController
  before_action :require_admin
  
  def index
  end
  
  def specials
    @specials = Special.all
    render :partial => "specials", :layout => false, :locals =>{:specials =>@specials}
    
  end
  
  def products
    @products = Product.all
    @product = Product.new
    render :partial => "products", :layout => false, :locals => {:products => @products}
    
  end
  
  def addProductRemote
	    @product = Product.new
	    @cateogires = Category.all
	    
	    render :layout => false     
  end
  
end
