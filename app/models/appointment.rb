class Appointment < ActiveRecord::Base
  belongs_to :client
  belongs_to :stylist


  now = DateTime.now
  # validate that starttime is at least 30 mins from now
  # deal with time zones eventually
  validates_uniqueness_of :start_time, scope: [:client_id, :stylist_id]

  validates_datetime :starttime, :after => now
end
