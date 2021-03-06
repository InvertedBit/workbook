class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :author
      can :create, Entry
    else
      can :read, :all
    end
  end
end
