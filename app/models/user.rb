class User < ApplicationRecord
    validates :name, presence: true
    validates :phoneNumber, presence: true
    validates :email, presence: true
    validates :interviewDate, presence: true
    validates :interviewTime, presence: true

    def self.get_dates
        #start_date = Admin.dateRange.split(/-/)[0]
        #end_date = Admin.dateRange.split(/-/)[1]
        @admins = Admin.all
        my_date = ""
        @admins.each do |a|
            my_date = a.dateRange
        end
        return my_date
    end

    def self.get_times
        @admins = Admin.all
        my_time = ""
        @admins.each do |a|
            my_time = a.timeRange
        end
        start_time = my_time.split(/-/)[0].rstrip.split("am")
        end_time = my_time.split(/-/)[1].rstrip.split("pm")
        puts(start_time)
        puts(end_time)
        return [start_time, end_time]
    end

end
