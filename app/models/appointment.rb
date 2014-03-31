class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist

  # validates :stylii_rating, numericality: { :greater_than => 0, :less_than_or_equal_to => 5} on: :update


  now = DateTime.now
  # validate that start time is at least 30 mins from now
  # deal with time zones eventually
  validates_uniqueness_of :start_time, scope: [:client_id, :stylist_id]

  validates_datetime :start_time, :after => now, on: :create


  def parse_start
    s = self.user_input
    if s
    parsed = Chronic::parse(s)
      self.update(start_time: parsed)
    end
  end

  def ending
    start = self.start_time
    plus_45 = start + 2700
    plus_30 = start + 1800
    if Client.find(self.client_id).gender == "female"
      self.update(:end_time => plus_45)
    else
      self.update(:end_time => plus_30)
    end
  end

# These following few methods check whether the stylist is working, and whether he or she is busy cutting hair at that time.

  def stylist_working_that_day?
    stylist = Stylist.find(self.stylist_id)
    if Chronic.parse(self.start_time).strftime("%A").downcase == stylist.day_off.downcase
      return true
    else
      return false
    end
  end

  def working_at_that_time?
    stylist = Stylist.find(self.stylist_id)
      if Chronic.parse(self.start_time).strftime("%I")

    end

  end

  def stylist_free
    stylist = Stylist.find(self.stylist_id)
  end


  after_initialize do |appointment|
    self.parse_start
    self.ending
  end

end
