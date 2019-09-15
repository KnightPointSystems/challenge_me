module Dueable
  extend ActiveSupport::Concern

  included do
    scope :due_between, ->(start_time, end_time) { where("due_date >= ? AND due_date <= ?", start_time, end_time) }
  end
end