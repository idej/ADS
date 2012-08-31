class User < ActiveRecord::Base
  include Enumerize

  has_many :advertisements, :dependent => :delete_all

  # Include default devise modules. Others available are:
  # :encryptable and :omniauthable
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :confirmed_at, :role,
          :first_name, :last_name, :middle_name

  enumerize :role, :in => [:user, :admin], :default => :user

end