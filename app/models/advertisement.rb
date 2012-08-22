class Advertisement < ActiveRecord::Base
  validates :content, :phone_number, :presence => true
  belongs_to :user

  # attr_accessible :title, :body
  attr_accessible :content, :create_date, :publicate_date, :phone_number, :life_cycle
end
