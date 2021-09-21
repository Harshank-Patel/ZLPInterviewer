class Book < ApplicationRecord
    validates :name, presence: true
    validates :time, presence: true
    validates :interviewer, presence: true
    validates :room, presence: true
    validates :phoneNumber, presence: true
end
