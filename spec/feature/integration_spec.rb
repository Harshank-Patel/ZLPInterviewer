# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an appointment!', type: :feature do
  scenario 'Valid Interviewee Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 3:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'

    visit new_user_path
    fill_in 'user_name', with: 'David Tang'
    fill_in 'user_phoneNumber', with: '281-301-9696'
    fill_in 'user_email', with: 'davidtang@tamu.edu'
    choose('user_interviewDateTime_2021-10-07900am')

    click_on 'Submit'
    expect(page).to have_content('David Tang')
    expect(page).to have_content('2021-10-07')
    expect(page).to have_content('9:00am')

    visit admins_path + '.csv'
  end

  scenario 'Invalid e-mail' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 3:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'

    visit new_user_path
    fill_in 'user_name', with: 'David Tang'
    fill_in 'user_phoneNumber', with: '281-301-9696'
    fill_in 'user_email', with: 'davidtang@gmail.com'
    choose('user_interviewDateTime_2021-10-07900am')
    click_on 'Submit'
    expect(page).to have_content('Email must end with @tamu.edu')
  end

  scenario 'Invalid phone number' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 3:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'

    visit new_user_path
    fill_in 'user_name', with: 'David Tang'
    fill_in 'user_phoneNumber', with: 'dadadadadadad'
    fill_in 'user_email', with: 'davidtang@tamu.edu'
    choose('user_interviewDateTime_2021-10-07900am')
    click_on 'Submit'
    expect(page).to have_content('Phone number must be of format: xxx-xxx-xxxx')
  end

  scenario 'Valid Admin Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 5:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'
    expect(page).to have_content('Fall 2021')
    expect(page).to have_content('2021-10-05:2021-10-08')
    expect(page).to have_content('8:00am - 5:00pm')
    expect(page).to have_content('30')
    expect(page).to have_content('3') 
  end

  scenario 'Delete Admin Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 5:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'
    click_on 'Back'
    click_on 'deleteAdmin'
    expect(page).not_to have_content('Fall 2021')
  end


scenario 'Update Admin Page' do
  visit new_admin_path
  fill_in 'admin_scheduleName', with: 'Fall 2021'
  fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
  fill_in 'admin_timeRange', with: '8:00am - 5:00pm'
  fill_in 'admin_interviewLength', with: '30'
  fill_in 'admin_numBreaks', with: '3'
  fill_in 'admin_numRooms', with: '2'
  click_on 'Submit'
  click_on 'Back'
  click_on 'editAdmin'
  fill_in 'admin_timeRange', with: '8:30am - 4:30pm'
  click_on 'Submit'
  expect(page).to have_content('8:30am - 4:30pm')
  end

scenario 'Destroy Interviewee' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am - 3:00pm'
    fill_in 'admin_interviewLength', with: '30'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Submit'

    visit new_user_path
    fill_in 'user_name', with: 'David Tang'
    fill_in 'user_phoneNumber', with: '281-301-9696'
    fill_in 'user_email', with: 'davidtang@tamu.edu'
    choose('user_interviewDateTime_2021-10-07900am')
    click_on 'Submit'

    visit admins_path
    click_on 'deleteInterviewee'

    expect(page).not_to have_content('David Tang')
    
  end
scenario 'Edit Interviewee' do
    visit new_admin_path
      fill_in 'admin_scheduleName', with: 'Fall 2021'
      fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
      fill_in 'admin_timeRange', with: '8:00am - 5:00pm'
      fill_in 'admin_interviewLength', with: '30'
      fill_in 'admin_numBreaks', with: '3'
      fill_in 'admin_numRooms', with: '2'
      click_on 'Submit'
      click_on 'Back'
      click_on 'editAdmin'
      click_on 'Submit'
      expect(page).to have_content('Fall 2021')
      expect(page).to have_content('2021-10-05:2021-10-08')
      expect(page).to have_content('30')
  
      visit new_user_path
      fill_in 'user_name', with: 'David Tang'
      fill_in 'user_phoneNumber', with: '281-301-9696'
      fill_in 'user_email', with: 'davidtang@tamu.edu'
      choose('user_interviewDateTime_2021-10-07900am')
      click_on 'Submit'
  
      visit admins_path
      click_on 'editInterviewee'
      fill_in 'user_name', with: 'David Tang'
      fill_in 'user_phoneNumber', with: '281-301-9696'
      fill_in 'user_email', with: 'davidtang@tamu.edu'
      choose('user_interviewDateTime_2021-10-07900am')
      click_on 'Submit'
      end
      scenario 'Update Admin Page' do
        visit new_admin_path
        fill_in 'admin_scheduleName', with: 'Fall 2021'
        fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
        fill_in 'admin_timeRange', with: '8:00am - 5:00pm'
        fill_in 'admin_interviewLength', with: '30'
        fill_in 'admin_numBreaks', with: '3'
        fill_in 'admin_numRooms', with: '2'
        click_on 'Submit'
        click_on 'Back'
        click_on 'editAdmin'
        click_on 'Submit'
        visit admins_path + '.csv'
        end
      

      scenario 'Destroy Interviewee' do
        visit new_admin_path
        fill_in 'admin_scheduleName', with: 'Fall 2021'
        fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
        fill_in 'admin_timeRange', with: '8:00am - 3:00pm'
        fill_in 'admin_interviewLength', with: '30'
        fill_in 'admin_numBreaks', with: '3'
        fill_in 'admin_numRooms', with: '2'
        click_on 'Submit'
    
        visit new_user_path
        fill_in 'user_name', with: 'David Tang'
        fill_in 'user_phoneNumber', with: '281-301-9696'
        fill_in 'user_email', with: 'davidtang@tamu.edu'
        choose('user_interviewDateTime_2021-10-07900am')
        click_on 'Submit'
    
        visit admins_path
        click_on 'deleteInterviewee'
    
        expect(page).not_to have_content('David Tang')
      end
      
end
