class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :sale, index: true
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
