class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist

  now = DateTime.now

  today = Date.today

  validates_uniqueness_of :start_time, scope: [:client_id, :stylist_id]
  validates_datetime :start_time, :after => now, on: :create
  validate :stylist_should_be_working_that_day, on: :create
  validate :stylist_should_be_working_at_that_time, on: :create
  validate :stylist_shouldnt_be_cutting_another_customers_hair, on: :create


  def parse_start
    s = self.user_input
    if s
    parsed = Chronic::parse(s)
      self.start_time = parsed
    end
  end

  def ending
    start = self.start_time
    if start && end_time == nil
      plus_45 = start + 2700
      plus_30 = start + 1800
      if Client.find(self.client_id).gender == "female"
        self.end_time = plus_45
      else
        self.end_time = plus_30
      end
    end
  end

# These following few methods check whether the stylist is working, and whether he or she is busy cutting hair at that time.

  def stylist_should_be_working_that_day
    stylist = Stylist.find(self.stylist_id)
      if self.start_time.strftime("%A").downcase == stylist.day_off.downcase
        errors.add(:start_time, "can't be on stylist's day off")
    end
  end

  def stylist_should_be_working_at_that_time
    return true
    stylist = Stylist.find(self.stylist_id)
      if self.start_time.seconds_until_end_of_day <= stylist.starts_work_at.seconds_until_end_of_day || self.end_time.seconds_until_end_of_day >= stylist.ends_work_at.seconds_until_end_of_day
      self.errors.add(:start_time, "can't be before stylist starts work or go on past stylist's time to go home")
    end
  end

  def stylist_shouldnt_be_cutting_another_customers_hair
    person = Stylist.find(self.stylist_id)
    appointments = Appointment.where(:stylist_id => person.id)
    future_appointments = []
    appointments.each do |x|
      if x.start_time.future?
        future_appointments << x
      end
    end

    future_appointments.each do |a|
      binding.pry
      end_time_local = a.end_time || (a.start_time + 900)

      if self.start_time.seconds_until_end_of_day == a.start_time.seconds_until_end_of_day || self.start_time.seconds_until_end_of_day.between?(a.start_time.seconds_until_end_of_day, end_time_local.seconds_until_end_of_day)
        errors.add(:start_time, "can't be during another customer's haircut")
      end
    end
  end
end


