class Advertisement < ActiveRecord::Base
  validates :content, :phone_number, :presence => true
  belongs_to :user
  belongs_to :type

  attr_accessible :content, :create_date, :publicate_date, :phone_number, :state, :type_id
end
