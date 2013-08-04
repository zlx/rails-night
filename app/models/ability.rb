class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.new_record?
      guest(user)
    elsif user.admin?
      admin(user)
    else
      normal_user(user)
    end
  end

  def guest user
    can :read, :all
  end

  def admin user
    can :manage, :all
  end


  def normal_user user
    guest user
    can :manage, Activity, author: user
  end
end
