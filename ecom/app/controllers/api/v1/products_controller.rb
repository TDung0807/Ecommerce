module Api
  module V1
    class ProductsController < ApplicationController
      skip_before_action :authenticate_user!, only: [:show, :index]
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /api/v1/products
      def index
        products = Product.includes(:category, :brand).all
        render json: products, include: [:category, :brand]
      end

      # GET /api/v1/products/:id
      def show
        render json: @product, include: [:category, :brand]
      end

      # POST /api/v1/products
      def create
        product = Product.new(product_params)
        if product.save
          render json: { message: "Product created successfully", product: product }, status: :created
        else
          render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/products/:id
      def update
        if @product.update(product_params)
          render json: { message: "Product updated successfully", product: @product }
        else
          render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/products/:id
      def destroy
        @product.destroy
        render json: { message: "Product deleted successfully" }, status: :ok
      end

      private

      def set_product
        @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Product not found" }, status: :not_found
      end

      def product_params
        params.require(:product).permit(:name, :img, :description, :sku, :price, :saleprice, :stock, :category_id, :brand_id)
      end
    end
  end
end
