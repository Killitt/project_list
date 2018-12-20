class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :title, :description, :status, presence: true
end
