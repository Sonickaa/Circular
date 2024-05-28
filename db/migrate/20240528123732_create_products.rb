class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.string :condition
      t.integer :price

      t.timestamps
    end
  end
end
