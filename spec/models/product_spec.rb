require "rails_helper"

RSpec.describe Product, type: :model do
  # Association
  it { should have_many(:cart_items).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }

  describe "#create" do
    it "creates a valid product" do
      product = Product.create(name: "Test Product", brand: "Test Brand", price: 10.99)
      expect(product).to be_valid
    end

    it "does not create a product without a name" do
      product = Product.create(price: 10.99)
      expect(product).to_not be_valid
    end
  end
end
