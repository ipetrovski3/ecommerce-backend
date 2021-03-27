module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[show update destroy]
      before_action :authorized
      
      def index
        @orders = Order.all
      end

      def create
        @product = Product.friendly.find(params[:product_id])
        @order = @product.orders.build(order_params)
        if @order.save
          render json: @order, status: 201
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @order
      end

      def update
        if @order.save(order_params)
          render json: @order, status: 201
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @order.delete
        head :no_content, status: :ok
      end

      private

      def order_params
        params.require(:order).permit(:first_name, :last_name, :address, :town, :note, :phone, :qty, :status)
      end

      def set_order
        @order = Order.find(params[:id])
      end
    end
  end
end
