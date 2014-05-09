class ServiceRequest < ActiveRecord::Base


  # Validations
  validates :email, :presence => true, :length => { :within => 5..100 }
  validates :name, :length => { :within => 2..64, :allow_blank => true }
  validates :message, :presence => true, :length => { :minimum => 10 }

   attr_accessible :address, :email, :message, :name, :phone, :state

  # Named scopes
  scope :unread, where(:read => false)
  scope :read, where(:read => true)

  # scope :night, where(:day => false)
  # scope :day, where(:day => true)


  # Logging
  after_create :log_create_event

  private #----

    def log_create_event
      Event.create(:description => "Photography service request from: #{email}")
    end
end
