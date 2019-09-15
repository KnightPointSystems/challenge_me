class TaskSchedule < ApplicationRecord
  include Dueable
  belongs_to :user
  scope :current, -> { where('due_date >= CURRENT_TIMESTAMP') }
  scope :expired, -> { where('due_date < CURRENT_TIMESTAMP') }

  def corresponding_task
    user.tasks.where(name: name).first
  end
end
