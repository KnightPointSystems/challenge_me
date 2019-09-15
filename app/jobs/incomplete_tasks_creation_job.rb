class IncompleteTasksCreationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    TaskSchedule::ProcessExpired.new.perform
  end
end