
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        can [:create, :read, :update, :destroy], User
        can :manage, :all
      else
        can [:read], Restoran
        can :manage, User
      end
    end
  end
end
