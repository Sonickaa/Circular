class CreateOfferProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :offer_products do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
