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
        #start_time = my_time.split(/-/)[0].rstrip.split("am")
        #end_time = my_time.split(/-/)[1].rstrip.split("pm")
        start_time = my_time.split(/-/)[0].rstrip
        end_time = my_time.split(/-/)[1].rstrip

        if start_time.include? "am"
            start_time = start_time.split("am")[0]
            start_time = start_time.split(":")[0].to_i  # gets the hour, and uses it as start
        elsif start_time.include? "pm"
            start_time = start_time.split("pm")[0]
            start_time = start_time.split(":")[0].to_i + 11 # gets the hour, and uses it as start
        end

        if end_time.include? "am"
            end_time = end_time.split("am")[0]
            end_time = end_time.split(":")[0].to_i  # gets the hour, and uses it as start
        elsif end_time.include? "pm"
            end_time = end_time.split("pm")[0]
            end_time = end_time.split(":")[0].to_i + 11 # gets the hour, and uses it as start. Plus 11 because time includes 30 minute from end time
        end


        puts(start_time)
        puts(end_time)
        return [start_time, end_time]
    end

end
