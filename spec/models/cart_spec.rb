require "rails_helper"

RSpec.describe Cart, type: :model do
  # Association
  it { should have_many(:cart_items).dependent(:destroy) }

  describe "#reset!" do
    it "removes all cart items" do
      cart = Cart.create
      product = Product.create(name: "Test Product", price: 10.99)
      cart.cart_items.create(product: product, quantity: 2)

      expect(cart.cart_items.count).to eq(1)

      expect { cart.reset! }.to change { cart.cart_items.count }.from(1).to(0)
    end
  end
end
