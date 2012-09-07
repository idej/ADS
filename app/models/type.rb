class Type < ActiveRecord::Base
  attr_accessible :type_name
  has_many :advertisements, :dependent => :delete_all

  before_destroy :can_be_destroy?

  def can_be_destroy?
    self.advertisements.empty?
  end
end
