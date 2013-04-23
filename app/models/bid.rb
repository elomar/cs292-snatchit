class Bid < ActiveRecord::Base
  belongs_to :product
  validates :value, :name, :email, presence: true

  def previous
    product.bids.order("value").where("id != ?", id).last
  end
end
