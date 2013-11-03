class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

def show
  @product = Product.find(params[:id])
end
  def new
  @product = Product.new
  @categories = Category.all
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
