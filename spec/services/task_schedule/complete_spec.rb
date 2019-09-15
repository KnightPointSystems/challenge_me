require 'rails_helper'

RSpec.describe TaskSchedule::Complete do
  describe '#perform' do
    context 'if task schedule is nil' do
      it 'should return false' do
        expect(TaskSchedule::Complete.new(nil).perform).to be false
      end
    end

    context 'if task schedule is an instance of TaskSchedule' do
      it 'should create or update a corresponding task with the same due date and mark it as completed' do
        task_schedule = TaskSchedule.first
        TaskSchedule::Complete.new(task_schedule).perform
        task = task_schedule.corresponding_task
        expect(task).to be_an_instance_of(Task)
        expect(task.due_date).to eq(task_schedule.due_date)
        expect(task.completed).to be true
      end
    end
  end
end