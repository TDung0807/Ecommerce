module Api
  module V1
    class BrandsController < ApplicationController
      skip_before_action :authenticate_user!, only: [:show, :index]
      before_action :set_brand, only: [:show, :update, :destroy]
      # GET /api/v1/brands
      def index
        brands = Brand.all
        render json: brands
      end

      # GET /api/v1/brands/:id
      def show
        render json: @brand
      end

      # POST /api/v1/brands
      def create
        brand = Brand.new(brand_params)
        if brand.save
          render json: { message: "Brand created successfully", brand: brand }, status: :created
        else
          render json: { errors: brand.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/brands/:id
      def update
        if @brand.update(brand_params)
          render json: { message: "Brand updated successfully", brand: @brand }
        else
          render json: { errors: @brand.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      # DELETE /api/v1/brands/:id
      def destroy
        @brand.destroy
        render json: { message: "Brand deleted successfully" }, status: :ok
      end

      private
      def set_brand
        @brand = Brand.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Brand not found" }, status: :not_found
      end
      def brand_params
        params.require(:brand).permit(:name, :description)
      end
    end
  end
end
