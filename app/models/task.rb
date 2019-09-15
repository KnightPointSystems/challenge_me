class Task < ApplicationRecord
  include Dueable
  belongs_to :user
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
