class Advertisement < ActiveRecord::Base
  validates :content, :phone_number, :presence => true
  belongs_to :user
  belongs_to :type

  attr_accessible :content, :create_date, :publicate_date, :phone_number, :state, :type_id

  state_machine :state, :initial => :draft do

    event :draft do
      transition [:publication, :canceled, :published, :archived] => :draft
    end

    event :publication do
      transition :draft => :publication
    end

    event :approved do
      transition :publication => :approved
    end

    event :canceled do
      transition :publication => :canceled
    end

    event :published do
      transition :approved => :published
    end

    event :archived do
      transition :published => :archived
    end

    state :publication, :draft, :canceled, :approved, :published, :archived
  end

  def possible_states(user)
    states = [:publication, :draft] if user.role.user?
    states = [:published, :canceled, :approved] if user.role.admin?
    states
  end
end
