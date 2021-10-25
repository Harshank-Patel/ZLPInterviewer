# frozen_string_literal: true

json.extract! admin, :id, :name, :dateRange, :timeRange, :interviewLength, :numBreaks, :created_at, :updated_at
json.url admin_url(admin, format: :json)
