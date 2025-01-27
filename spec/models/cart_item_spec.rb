require "rails_helper"

RSpec.describe CartItem, type: :model do
  # Associations
  it { should belong_to(:cart) }
  it { should belong_to(:product) }

  # Validations
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }

  describe "#create" do
    it "creates a valid cart item" do
      cart = Cart.create
      product = Product.create(name: "Test Product", brand: "Brand", price: 5.99)
      cart_item = CartItem.create(cart: cart, product: product, quantity: 1)

      expect(cart_item).to be_valid
    end
  end
end
