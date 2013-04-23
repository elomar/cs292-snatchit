class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Product, sale_id: user.sale.id
    end
  end
end
