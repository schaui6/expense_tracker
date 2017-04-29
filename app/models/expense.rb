class Expense < ApplicationRecord
  belongs_to :user
  validates :date,:time,:amount,:user_id, :description, presence: true
end
