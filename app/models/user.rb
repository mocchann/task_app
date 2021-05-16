class User < ApplicationRecord
  validates :title, presence: true
  validates :startday, presence: true
  validates :finishday, presence: true
  validate :start_day
  validate :finish_day
  
  def start_day
    return if startday.blank?
    errors.add(:startday, "は今日以降のものを選択してください") if startday < Date.today
  end

  def finish_day
    return if finishday.blank? || startday.blank?
    errors.add(:finishday, "は今日以降のものを選択してください") if finishday < Date.today
  end
end