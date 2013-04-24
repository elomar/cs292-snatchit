class Bid < ActiveRecord::Base
  belongs_to :product
  validates :value, :name, :email, presence: true
  validates :value, numericality: { greater_than: -> (bid) { bid.product.current_value} }

  def previous
    product.bids.order("value").where("id != ?", id).last
  end
end
