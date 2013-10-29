class ProductsController < ApplicationController
    def new
	@product = Product.create(params[:product])
    end

    def create
	@product = Product.create(params[:product])
    end

    def show
	@product = Product.find(params[:id])
    end
    
    def index
	@products = Product.all
    end

    def product_params
       params.require(:product).permit(:avatar)
    end
end
