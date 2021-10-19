class Admin < ApplicationRecord
    validates :scheduleName, presence: true
    validates :dateRange, presence: true
    validates :timeRange, presence: true
    validates :interviewLength, presence: true
    validates :numBreaks, presence: true
    validates :numRooms, presence: true
end
