module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update]
      def index
        @categories = Category.all
      end

      def show; end

      def create
        category = Category.new(category_params)
        if category.save
          render json: { id: category.id, name: category.name }, status: 201
        else
          render json: 'Bad Request', status: 400
        end
      end

      def update
        if @category.update(category_params)
          render json: { id: @category.id, name: @category.name }, status: 200
        else
          render json: 'Cannot Update', status: 400
        end
      end

      def destroy
        @category.delete
        head :no_content, status: 200
      end

      private

      def category_params
        params.require(:category).permit(:name, :image)
      end

      def set_category
        @category = Category.friendly.find(params[:id])
      end
    end
  end
end
