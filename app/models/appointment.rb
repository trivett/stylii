class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist



  now = DateTime.now

  today = Date.today

  validates_uniqueness_of :start_time, scope: [:client_id, :stylist_id]

  validates_datetime :start_time, :after => now, on: :create

  validate :stylist_should_be_working, on: :create

  validate :stylist_should_be_working_at_that_time, on: :create

  validate :stylist_shouldnt_be_cutting_another_customers_hair, on: :create



  validates :stylii_rating, numericality: { :greater_than => 0, :less_than_or_equal_to => 5}, on: :update


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

  def stylist_should_be_working
    stylist = Stylist.find(self.stylist_id)
      self.parse_start
      if self.start_time.strftime("%A").downcase == stylist.day_off.downcase
        errors.add(:start_time, "can't be on stylist's day off")
    end
  end

  def stylist_should_be_working_at_that_time
    self.parse_start
    self.ending
    start = self.start_time
    stylist = Stylist.find(self.stylist_id)
      if start.to_time <= stylist.starts_work_at.to_time || self.end_time.to_time <= stylist.ends_work_at.to_time
      errors.add(:start_time, "can't be before stylist starts work or go on past stylist's time to go home")
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
      end_time_local = a.end_time || (a.start_time + 900)

      if self.start_time.between?(a.start_time.to_time, end_time_local.to_time)
        errors.add(:start_time, "can't be during another customer's haircut")
        break


      end

    end

  end




end


