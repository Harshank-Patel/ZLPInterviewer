# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phoneNumber
      t.string :email
      t.string :interviewDateTime

      t.timestamps
    end
  end
end
