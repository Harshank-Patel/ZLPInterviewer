# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :scheduleName, presence: true
  validates :dateRange, presence: true
  validates :timeRange, presence: true
  validates :interviewLength, presence: true
  validates :numBreaks, presence: true
  validates :numRooms, presence: true
=begin
  def self.sort_datetime
    @users = User.all
    dt_list = []
    @users.each do |dt|
      dt_list.push(dt.interviewDateTime)
    end
    dt_list = dt_list.sort
    puts dt_list
    dt_list
  end
=end
end
