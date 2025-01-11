class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart = Cart.first_or_create
  end
end