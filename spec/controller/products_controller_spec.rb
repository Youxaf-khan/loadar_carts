require "rails_helper"

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns all products to @products" do
      product1 = Product.create(name: "Product 1", price: 10.99)
      product2 = Product.create(name: "Product 2", price: 15.99)

      get :index
      expect(assigns(:products)).to match_array([ product1, product2 ])
    end
  end
end
