class Bid < ActiveRecord::Base
  belongs_to :product
  validates :value, :name, :email, presence: true
  validates :value, numericality: { greater_than: -> (bid) { bid.product.current_value} }

  after_create :update_product_current_value

  def previous
    product.bids.order("value").where("id != ?", id).last
  end

  protected

  def update_product_current_value
    product.update_attributes current_value: product.bids.maximum("value") || product.current_value
  end
end
