class ProductsController < ApplicationController
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
    #@product.destroy
    render text: "Removed"
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
    redirect_to @product
  else
    render 'new'
  end
end

end
