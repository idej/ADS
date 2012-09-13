class Advertisement < ActiveRecord::Base
  validates :content, :phone_number, :presence => true
  belongs_to :user
  belongs_to :type
  self.per_page = 3

  attr_accessible :content, :create_date, :publicate_date, :phone_number, :type_id

  state_machine :state, :initial => :draft do

    event :to_drafts do
      transition [:canceled, :archived] => :draft
    end

    event :to_new do
      transition :draft => :new
    end

    event :approve do
      transition :new => :approved
    end

    event :cancel do
      transition :new => :canceled
    end

    event :publish do
      transition :approved => :published
    end

    event :archive do
      transition :published => :archived
    end

    state :draft, :new, :canceled, :approved, :published, :archived
  end

  def possible_states(user)
    states = Array.new
    if user.role.user?
      case self.state
        when 'draft'
          states = [:draft, :new]
        when 'archived'
          states = [:draft]
        when 'canceled'
          states = [:draft]
      end
    elsif user.role.admin?
      case self.state
        when 'new'
          states = [:cancel, :approve]
      end
    end
    states
  end
end
