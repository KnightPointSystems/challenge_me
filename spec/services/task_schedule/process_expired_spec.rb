require 'rails_helper'

RSpec.describe TaskSchedule::ProcessExpired do
  describe '#perform' do
    context 'if there are expired task schedules' do
      it 'should create corresponding incomplete task for each of them' do
        TaskSchedule::ProcessExpired.new.perform
        TaskSchedule.expired.each do |expired_task_schedule|
          incomplete_task = expired_task_schedule.user.tasks.where(name: expired_task_schedule.name, completed: false, due_date: expired_task_schedule.due_date).first
          expect(incomplete_task).to be_an_instance_of(Task)
        end
      end
    end
  end
end