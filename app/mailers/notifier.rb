class Notifier < ActionMailer::Base
  default from: "elomar@elomar.me"

  def new_bid(bid)
    @bid = bid
    @user = bid.product.sale.user

    mail to: @user.email, subject: "New bid on #{bid.product}"
  end

  def product_snatched(previous_bid)
    @previous_bid = previous_bid
    @url = sale_products_url(@previous_bid.product.sale)

    mail to: @previous_bid.email, subject: "Hey #{@previous_bid.name}, someone is trying to snatch your stuff!"
  end
end
