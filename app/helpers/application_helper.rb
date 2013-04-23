module ApplicationHelper
  def sale_owner
    if @sale.present?
      @sale.user
    else
      "everybody"
    end
  end
end
