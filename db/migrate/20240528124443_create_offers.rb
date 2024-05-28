class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.references :user_sender, null: false
      t.references :user_receiver, null: false
      t.integer :status

      t.timestamps
    end
    add_foreign_key :offers, :users, column: :user_sender_id, primary_key: :id
    add_foreign_key :offers, :users, column: :user_receiver_id, primary_key: :id
  end
end
