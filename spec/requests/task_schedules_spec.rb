require 'rails_helper'

RSpec.describe "TaskSchedules", type: :request do
  describe "GET /task_schedules" do
    it "works! (now write some real specs)" do
      get task_schedules_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /task_schedule/:id" do
    let(:task_schedule) { TaskSchedule.first }
    it "redirects to the user's show page" do
      patch complete_task_schedule_path(task_schedule)
      expect(response).to redirect_to(task_schedule.user)
    end
  end
end
