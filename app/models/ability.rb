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
    can :update, Advertisement, :user_id => @user.id
  end

  def admin
    can [:read, :destroy], Advertisement
  end

  def guest
    can :read, Advertisement
  end
end
