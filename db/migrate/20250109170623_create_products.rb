class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
