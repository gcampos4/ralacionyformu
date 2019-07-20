class ProductsController < ApplicationController

    def create
        @product = Product.new (products_params)
        @product.category = Category.find(params[:category_id])
        @product.save

        redirect_to @product.category
    end

    def destroy
        @product = Product.find(params[:id])
        @product.delete
        redirect_to @product.category
      end

    private
    def products_params
        params.require(:product).permit(:name, :price)
    end
end
