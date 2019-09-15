class User < ApplicationRecord
  has_many :tasks
  has_many :task_schedules
  # Need to nilify time zone since passing a blank string like '' to the #in_time_zone method will cause an error
  before_validation :nilify_time_zone_if_blank

  private

  def nilify_time_zone_if_blank
    self.time_zone = time_zone.presence
  end
end
