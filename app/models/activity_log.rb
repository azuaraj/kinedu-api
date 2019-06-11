class ActivityLog < ApplicationRecord
  before_update :calculate_duration
  validate :start_time_cannot_be_greater_than_stop_time

  def calculate_duration
    self.duration = (self.stop_time - self.start_time)/60
  end

  def updated_at
    attributes['updated_at'].strftime("%m/%d/%Y")
  end

  def created_at
    attributes['created_at'].strftime("%m/%d/%Y")
  end

  def start_time_cannot_be_greater_than_stop_time
    if start_time.present? && start_time > stop_time
      errors.add(:stop_time, "Activity stop time can't be in the past")
    end
  end

end
