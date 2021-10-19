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

    def self.list_days
        @admins = Admin.all
        my_date = ""
        @admins.each do |a|
            my_date = a.dateRange
        end

        start_date = Date.parse(my_date.split(/:/)[0].to_s)
        end_date = Date.parse(my_date.split(/:/)[1].to_s)
        date_list = (start_date..end_date).map(&:to_s)
        #puts (date_list)
        return date_list
    end

    def self.list_times
        @admins = Admin.all
        num_breaks = ""
        interview_length = ""
        my_time = ""
        @admins.each do |a|
            num_breaks = a.numBreaks
            interview_length = a.interviewLength
            my_time = a.timeRange
        end

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

        x = start_time
        min = 0
        break_count = 0
        time_list = []
        while x <= end_time
            if(x <= 12)
                if min == 0
                    min = "00"
                end
                if x == 12
                    time_list.push(x.to_s + ":" + min.to_s + "pm")
                else
                    time_list.push(x.to_s + ":" + min.to_s + "am")
                end
            else
                if min == 0
                    min = "00"
                end
                time_list.push((x-12).to_s + ":" + min.to_s + "pm")
            end

            # increase minute by interview length
            min = min.to_i + interview_length.to_i
            if min == 60
                min = 0
            end
            if min != 0
                x = x
            else
                x = x + 1
            end
            break_count = break_count + 1
        end


        puts (time_list)
        return time_list
    end




end
