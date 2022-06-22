
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can [:read], Restoran
      can :manage, User
    end
  end
end
