class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    @user ||= User.new # guest
    role = @user.persisted? ? @user.role : :guest
    send(role)
  end

  def user
    published_ads
    can [:create], Advertisement
    can [:update, :destroy, :read, :change_state], Advertisement, :user_id => @user.id
    can [:update, :read], User, :id => @user.id
  end

  def admin
    can [:read, :destroy, :change_state], Advertisement
    can :manage, [User, Type]
    cannot :change_role, User, :id => @user.id
  end

  def guest
    published_ads
  end

  def published_ads
    can :read, Advertisement, :state => "published"
  end
end
