require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  let!(:cart) { Cart.create } # Persist a cart to the database
  let!(:product) { Product.create(name: 'Test Product', price: 10.99) }

  describe 'GET #index' do
    it 'assigns all cart items to @cart_items' do
      cart_item = cart.cart_items.create(product: product, quantity: 1)

      get :index
      expect(assigns(:cart_items)).to eq([ cart_item ])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    it 'creates a new cart item' do
      expect {
        post :create, params: { product_id: product.id }
      }.to change { CartItem.count }.by(1)
    end
  end

  describe 'PATCH #update' do
    let!(:cart_item) { cart.cart_items.create(product: product, quantity: 1) }

    it 'updates the cart item' do
      patch :update, params: { id: cart_item.id, cart_item: { quantity: 5 } }
      cart_item.reload
      expect(cart_item.quantity).to eq(5)
    end
  end

  describe 'DELETE #destroy' do
    let!(:cart_item) { cart.cart_items.create(product: product, quantity: 1) }

    it 'removes the cart item' do
      expect {
        delete :destroy, params: { id: cart_item.id }, format: :turbo_stream
      }.to change { CartItem.count }.by(-1)
    end
  end
end
