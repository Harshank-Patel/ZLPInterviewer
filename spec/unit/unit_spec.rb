# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    admin = Admin.new(scheduleName: 'Fall 2021', dateRange: '2021-10-05:2021-10-08', timeRange: '8:00am - 3:00pm', interviewLength: '30', numBreaks:'3', numRooms:'2')
    expect(admin).to be_valid
    described_class.new(name: 'David Erdner', phoneNumber: '111-111-1111', email: 'derdner@tamu.edu',
                        interviewDateTime: '2021-10-05,8:00am')
  end

  it 'is valid name with valid attributes' do

    admin = Admin.new(scheduleName: 'Fall 2021', dateRange: '2021-10-05:2021-10-08', timeRange: '8:00am - 3:00pm', interviewLength: '30', numBreaks:'3', numRooms:'2')
    expect(admin).to be_valid
    #name = User.new(name: 'David Erdner', phoneNumber: '111-111-1111', email: 'derdner@tamu.edu',
     #              interviewDateTime: "2021-10-05,8:00am")
   # expect(name).to be_valid
  end

  # it 'is valid phonenumber with valid attributes' do
  #   phoneNumber = User.new(phoneNumber: '111-111-1111', name: 'David Erdner', email: 'derdner@tamu.edu',
  #                          interviewDateTime: '2021-10-05,10:00am')
  #   expect(phoneNumber).to be_valid
  # end

  # it 'is valid email with valid attributes' do
  #   email = User.new(email: 'derdner@tamu.edu', name: 'David Erdner', phoneNumber: '111-111-1111',
  #                    interviewDateTime: '2021-10-05,8:00am')
  #   expect(email).to be_valid
  # end

  # it 'is valid interviewDate with valid attributes' do
  #   interviewDateTime = User.new(interviewDateTime: '10/7/2021 , 8:00am', name: 'David Erdner',
  #                            phoneNumber: '111-111-1111', email: 'derdner@tamu.edu')
  #   expect(interviewDateTime).to be_valid
  # end

  # it 'is valid interviewTime with valid attributes' do
  #   interviewTime = User.new(interviewDateTime: '10/7/2021 , 8:00am', name: 'David Erdner',
  #                            phoneNumber: '111-111-1111', email: 'derdner@tamu.edu')
  #   expect(interviewTime).to be_valid
  # end
end


  