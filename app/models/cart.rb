class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total_price
    cart_items.sum(&:total_price)
  end

  def discounted_total(discount = 0)
    [ total_price - discount, 0 ].max
  end

  def reset!
    cart_items.destroy_all
  end
end
