class Product < ActiveRecord::Base
  belongs_to :sale
  has_many :bids
  validates_presence_of :title
  mount_uploader :picture, PictureUploader

  default_scope order("updated_at desc")

  def new_bid(params)
    bids.new params.merge(value: next_value)
  end

  def next_value
    current_value + current_value/10 + 1
  end

  def to_s
    title
  end
end
