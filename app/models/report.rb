class Report < ApplicationRecord
  belongs_to :user
  validates :start_date, :end_date, :total, :user_id,  presence: true
end
