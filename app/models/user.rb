class User < ApplicationRecord
    validates :name, presence: true
    validates :phoneNumber, presence: true
    validates :email, presence: true
    validates :interviewDate, presence: true
    validates :interviewTime, presence: true
end
