class TaskSchedule < ApplicationRecord
  belongs_to :user

  def corresponding_task
    user.tasks.where(name: name).first
  end
end
