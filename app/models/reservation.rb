class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :user_id, :room_id, :start_date, :end_date, :total_price, presence: true
  validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_in_start_date

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, ": 過去の日付は使えません")
    end
  end

  def end_date_cannot_be_in_start_date
    if end_date.present? && end_date < start_date
      errors.add(:end_date, ": 開始日より前の日付は使えません")
    end
  end
end
