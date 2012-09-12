class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @user ||= User.new # guest
    role = @user.persisted? ? @user.role : :guest
    send(role)
  end

  def user
    can [:create, :read], Advertisement
    can [:update, :destroy, :change_state], Advertisement, :user_id => @user.id
    can [:update, :read], User, :id => @user.id
  end

  def admin
    can [:read, :destroy, :change_state], Advertisement
    can :manage, [User, Type]
  end

  def guest
    can :read, Advertisement
  end
end
