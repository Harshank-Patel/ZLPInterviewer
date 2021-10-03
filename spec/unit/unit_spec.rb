# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'David Erdner', phoneNumber: '111-111-1111', email: 'derdner@tamu.edu', interviewDate: '10/7/2021', interviewTime: '8:00am')
  end

  
  it 'is valid name with valid attributes' do
    name = User.new(name: 'David Erdner')
    expect(name).to be_valid
  end

  
  it 'is valid phonenumber with valid attributes' do
    phoneNumber = User.new(phoneNumber:'111-111-1111')
    expect(phoneNumber).to be_valid
  end


  it 'is valid email with valid attributes' do
    email = User.new(email: 'derdner@tamu.edu')
    expect(email).to be_valid
  end

  it 'is valid interviewDate with valid attributes' do
    interviewDate = User.new(interviewDate: 10/7/2021) 
    expect(interviewDate).to be_valid
  end
end