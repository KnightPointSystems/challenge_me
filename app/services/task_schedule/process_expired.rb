class TaskSchedule::ProcessExpired
  def perform
    TaskSchedule.expired.each do |expired_task_schedule|
      TaskSchedule::Incomplete.new(expired_task_schedule).perform
    end
  end
end