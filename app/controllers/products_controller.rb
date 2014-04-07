class ProductsController < ApplicationController
 skip_before_action :require_login, only: [:show, :index]
  
 def index   
    @cat = params[:cat]
    @products =  @cat.blank? ? Product.all : Product.where(category_id: @cat) 
 end
 
 def partIdx
    @cats = params[:cats]
    @products = @cats.blank? ? Product.all : Product.where(category_id: @cats)
    
    render :partial => "images", :layout => false, :locals =>{:products =>@products}
 end

def show
  @product = Product.find(params[:id])
end

def new
  @product = Product.new
  @categories = Category.all
end
 
def destroy
    Product.delete(params[:id]);
    redirect_to :back
    
end

def createRemote
   @product = Product.new(params[:product].permit(:image, :title, :description, :price))
   @product.category_id = params[:product][:category];
   
   if @product.save
       render inline: "<%= link_to 'Create New Product', :controller=> 'admin', :action => 'addProductRemote' %>"
   else
      redirect_to "/admin/addProductRemote", :flash => { :error => "There was a problem. Contact Jonathan if this persists." }
   end
end

def create
  @product = Product.new(params[:product].permit(:image, :title, :description, :price))
  
  cat = Category.find_by name: params[:product][:category]
  if cat.blank? 
     cat = Category.new(:name => params[:product][:category])
     cat.save()
  end
 
  @product.category_id = cat.id
  
  if @product.save
    redirect_to :back
    @activeTab = 'products'
  else
    flash[:notice] = 'product created'
    redirect_to @product
  end
end

def require_login


end

end
