# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create sample products
products = [
  {
    name: 'Wireless speaker',
    brand: 'Goodyear',
    price: 100.00,
    image_url: 'speaker.svg'
  },
  {
    name: "Women's Home Suit",
    brand: 'Sweet Dreams',
    price: 25.00,
    image_url: 'suit.svg'
  },
  {
    name: 'Raincoat',
    brand: 'SwissOak',
    price: 50.00,
    image_url: 'raincoat.svg'
  }
]

products.each do |product|
  Product.create!(product)
end
