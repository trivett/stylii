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


  # def rate(num)
  #   self.update(stylii_rating: num)
  # end


  # def future?
  #   if self.start_time > DateTime.now
  #     return true
  #   else
  #     return false
  #   end
  # end


  after_initialize do |appointment|
    self.parse_start
  end

end
