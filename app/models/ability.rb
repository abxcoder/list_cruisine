
class Ability
  include CanCan::Ability

  
  def initialize(user)
    user ||= User.new
    if user.present?
      if user.admin?
        can [:create, :read, :update, :destroy], User
        can :manage, :all
      elsif user.premium?
        can :read, User
        # cannot [:index, :show], FoodsController
        cannot [:create, :read, :update, :destroy], FoodsController
      else
        can :manage, User
      end
    end
  end
end
