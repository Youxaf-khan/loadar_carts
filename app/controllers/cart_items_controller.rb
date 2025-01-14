class CartItemsController < ApplicationController
  before_action :set_cart

  def index
    @cart_items = @cart.cart_items.includes(:product) || []
    @max_discount = 100
  end

  def create
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
    @cart_item.quantity = @cart_item.quantity.to_i + 1

    if @cart_item.save
      respond_to do |format|
        format.turbo_stream { redirect_to cart_items_path }
        format.html { redirect_to cart_items_path }
      end
    end
  end

  def update
    @cart_item = @cart.cart_items.find(params[:id])

    return unless @cart_item.update(cart_item_params)

    @cart_items = @cart.cart_items

    if @cart_item.update(cart_item_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("cart", template: "cart_items/index", locals: { cart_items: @cart_items })
        end
        format.html { redirect_to cart_items_path }
      end
    end
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.turbo_stream do
        if @cart.cart_items.any?
          render turbo_stream: turbo_stream.remove(@cart_item)
        else
          render turbo_stream: turbo_stream.replace("cart", partial: "cart_items/empty_cart")
        end
      end
    end
  end

  def reset
    @cart.reset!

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("cart", partial: "cart_items/empty_cart")
      end
      format.html { redirect_to cart_items_path }
    end
  end

  private

  def set_cart
    @cart = Cart.first_or_create
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
