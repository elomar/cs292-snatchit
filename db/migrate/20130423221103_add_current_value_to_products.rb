class AddCurrentValueToProducts < ActiveRecord::Migration
  def change
    add_column :products, :current_value, :integer, default: 0
  end
end
