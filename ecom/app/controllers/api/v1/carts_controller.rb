module Api
  module V1
    class CartsController < ApplicationController
      before_action :set_cart, only: [:show, :update, :destroy]

      # GET /api/v1/carts
      def index
        carts = Cart.includes(:cart_items, :products).all
        render json: carts, include: [:cart_items, :products]
      end

      # GET /api/v1/carts/:id
      def show
        render json: @cart, include: [:cart_items, :products]
      end

      # POST /api/v1/carts
      def create
        cart = Cart.new(cart_params)
        if cart.save
          render json: { message: "Cart created successfully", cart: cart }, status: :created
        else
          render json: { errors: cart.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/carts/:id
      def update
        if @cart.update(cart_params)
          render json: { message: "Cart updated successfully", cart: @cart }
        else
          render json: { errors: @cart.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/carts/:id
      def destroy
        @cart.destroy
        render json: { message: "Cart deleted successfully" }, status: :ok
      end

      private

      def set_cart
        @cart = Cart.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Cart not found" }, status: :not_found
      end

      def cart_params
        params.require(:cart).permit(:user_id)
      end
    end
  end
end
