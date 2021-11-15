class Admin < ApplicationRecord
    validates :scheduleName, presence: true
    validates :dateRange, presence: true
    validates :timeRange, presence: true
    validates :interviewLength, presence: true
    validates :numBreaks, presence: true
    validates :numRooms, presence: true
    validate :date_validator
    validate :time_validator
    validates_format_of :interviewLength, :with => /\A([0-9]+)\z/, :message => "must be numeric"
    validates_format_of :numBreaks, :with => /\A([0-9]+)\z/, :message => "must be numeric"
    validates_format_of :numRooms, :with => /\A([0-9]+)\z/, :message => "must be numeric"

    def date_validator
        date_regex = /\A([0-9]{4})-([0-9]{2})-([0-9]{2}):([0-9]{4})-([0-9]{2})-([0-9]{2})\z/
        date_range = "Date Range"
        if dateRange.blank? || !dateRange.match(date_regex)
            self.errors.add(:date_range, 'must be of format: yyyy-mm-dd:yyyy-mm-dd')
            return
        end

        if dateRange.split(/:/)[0].to_str > dateRange.split(/:/)[1].to_str
            self.errors.add(:date_range, 'start date must be before end date.')
        end

        begin
            Date.parse(dateRange.split(/:/)[0])
            Date.parse(dateRange.split(/:/)[1])
        rescue ArgumentError
            self.errors.add(:date_range, ' is invalid. Please make sure date is valid calendar date.')
        end
    end

    def time_validator
        time_regex = /\A([0-9]{1,2}):([0-9]{2})(am)(.+)-(.+)([0-9]{1,2}):([0-9]{2})(pm)\z/
        time_range = "Time Range"
        if timeRange.blank? || !timeRange.match(time_regex)
            self.errors.add(:time_range, 'must be of format: xx:xxam - xx:xxpm')
            return
        end

        st = timeRange.split(/-/)[0].split(/:/)[0].to_i 
        et = timeRange.split(/-/)[1].split(/:/)[0].to_i 
        if st > 12 || st < 1 || et > 12 || et < 1
            self.errors.add(:time_range, 'must be valid time')
            return
        end
    end


    def self.sort_datetime
        @users = User.all
        dt_list = []
        @users.each do |dt|
            dt_list.push(dt.interviewDateTime)
        end
        dt_list = dt_list.sort
        puts dt_list
        return dt_list

    end

    def self.to_csv
        @users = User.all
        dt_array = []
        @users.sort_by(&:interviewDateTime).each do |user|
          dt_array.push([user.interviewDateTime.split(/,/)[0], user.interviewDateTime.split(/,/)[1], user])
        end
        dt_array.each do |dt|
          if dt[1].to_s.include? "am" 
            dt[1] = dt[1].split(/:/)[0].to_i + dt[1].split(/:/)[1].to_i/60
          elsif dt[1].to_s.include? "pm"
            if dt[1].split(/:/)[0].to_i == 12
              dt[1] = dt[1].split(/:/)[0].to_i + dt[1].split(/:/)[1].to_i/60
            else
              dt[1] = dt[1].split(/:/)[0].to_i + 12 + dt[1].split(/:/)[1].to_i/60
            end
          end
          dt[1] = dt[1].to_i
        end
        dt_array = dt_array.sort_by {|d,t| [d, t]}

        csv_string = CSV.generate do |csv|
          csv << ["Name", "Phone Number", "Email", "Interview Date", "Interview Time"]
          dt_array.each do |l|
            user = l[2]
            new_pn = user.phoneNumber
            if !new_pn.include? "-"
              new_pn = user.phoneNumber[0..2].to_s + "-" + user.phoneNumber[3..5].to_s + "-" + user.phoneNumber[6..9].to_s
            end
            csv << [user.name, new_pn, user.email, user.interviewDateTime.split(/,/)[0], user.interviewDateTime.split(/,/)[1]]
          end
        end
    end


end