class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :product, index: true
      t.integer :value
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
