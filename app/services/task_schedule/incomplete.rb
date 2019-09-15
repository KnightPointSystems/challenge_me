class TaskSchedule::Incomplete
  def initialize(task_schedule)
    @task_schedule = task_schedule
  end

  def perform
    return false unless @task_schedule
    task = Task.where(name: @task_schedule.name, user_id: @task_schedule.user_id).first_or_initialize
    # unless task.completed: If a task is marked completed, don't mark it as incomplete
    task.update(completed: false, due_date: @task_schedule.due_date) unless task.completed
  end
end