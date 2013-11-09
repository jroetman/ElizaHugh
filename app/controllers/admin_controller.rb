class AdminController < ApplicationController
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
end
