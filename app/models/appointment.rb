class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist



  now = DateTime.now
  # validate that start time is at least 30 mins from now
  # deal with time zones eventually
  validates_uniqueness_of :start_time, scope: [:client_id, :stylist_id]

  validates_datetime :start_time, :after => now, on: :create

  validate :stylist_should_be_working

  validate :stylist_should_be_working_at_that_time

  validate :stylist_shouldnt_be_cutting_another_customers_hair



  validates :stylii_rating, numericality: { :greater_than => 0, :less_than_or_equal_to => 5}, on: :update


  def parse_start
    s = self.user_input
    if s
    parsed = Chronic::parse(s)
      self.update(start_time: parsed)
    end
  end

  def ending
    start = self.start_time
      if start && end_time == nil
        plus_45 = start + 2700
        plus_30 = start + 1800
        if Client.find(self.client_id).gender == "female"
          self.update(:end_time => plus_45)
        else
          self.update(:end_time => plus_30)
        ending
      end
    end
  end

# These following few methods check whether the stylist is working, and whether he or she is busy cutting hair at that time.

  def stylist_should_be_working
    stylist = Stylist.find(self.stylist_id)
    if self.start_time.strftime("%A").downcase == stylist.day_off.downcase
      errors.add(:start_time, "can't be on stylist's day off")
    end
  end

  def stylist_should_be_working_at_that_time
    self.ending
    start = self.start_time
    stylist = Stylist.find(self.stylist_id)
      if start.to_time <= stylist.starts_work_at.to_time || self.end_time.to_time <= stylist.ends_work_at.to_time
      errors.add(:start_time, "can't be before stylist starts work or go on past stylist's time to go home")
    end
  end

  def stylist_shouldnt_be_cutting_another_customers_hair
    stylist = Stylist.find(self.stylist_id)
    appointments = Appointment.where(:stylist_id => stylist.id)
    future_appointments = []
    appointments.each do |x|
      if x.start_time.future?
        future_appointments << x
      end
    end


  future_appointments.each do |a|
    if self.start_time > a.start_time && self.start_time < a.end_time || self.end_time > a.start_time && self.end_time < a.end_time

      errors.add(:start_time, "can't be during another customer's haircut")
    end
  end
end

end


