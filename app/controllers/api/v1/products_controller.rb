module Api
  module V1
    class ProductsController < ApplicationController
      before_action :find_product, only: %i[show update destroy]
      def index
        @products = Product.all
        render json: @products
      end

      def show
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update!(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
        head :no_content, status: :ok
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :price, :category_id)
      end

      def find_product
        @product = Product.friendly.find(params[:id])
      end
    end
  end
end
