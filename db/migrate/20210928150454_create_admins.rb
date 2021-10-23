# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :scheduleName
      t.string :dateRange
      t.string :timeRange
      t.string :interviewLength
      t.string :numBreaks
      t.string :numRooms

      t.timestamps
    end
  end
end
