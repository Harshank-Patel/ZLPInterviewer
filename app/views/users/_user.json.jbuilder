json.extract! user, :id, :name, :phoneNumber, :email, :interviewDate, :interviewTime, :created_at, :updated_at
json.url user_url(user, format: :json)
