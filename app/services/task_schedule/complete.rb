class TaskSchedule::Complete
  def initialize(task_schedule)
    @task_schedule = task_schedule
  end

  def perform
    return false unless @task_schedule
    task = Task.where(name: @task_schedule.name, user_id: @task_schedule.user_id).first_or_initialize
    task.update(completed: true, due_date: @task_schedule.due_date)
  end
end