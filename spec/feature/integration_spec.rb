# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an appoinment!', type: :feature do
  scenario 'Valid Interviewee Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am-3:00pm'
    fill_in 'admin_interviewLength', with: '30min'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Create Admin'

    visit new_user_path
    fill_in 'user_name', with: 'David Tang'
    fill_in 'user_phoneNumber', with: '281-301-9696'
    fill_in 'user_email', with: 'davidtang@tamu.edu'
    choose('user_interviewDateTime_2021-10-07900am')

    click_on 'Submit'
    visit @user
    expect(page).to have_content('David Tang')
    expect(page).to have_content('281-301-9696')
    expect(page).to have_content('davidtang@tamu.edu')
    expect(page).to have_content('2021-10-07')
    expect(page).to have_content('9:00am')
  end

  scenario 'Valid Admin Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am-5:00pm'
    fill_in 'admin_interviewLength', with: '30min'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Create Admin'
    expect(page).to have_content('Fall 2021')
    expect(page).to have_content('2021-10-05:2021-10-08')
    expect(page).to have_content('8:00am-5:00pm')
    expect(page).to have_content('30min')
    expect(page).to have_content('3') 
    expect(page).to have_content('2')
  end

  scenario 'Delete Admin Page' do
    visit new_admin_path
    fill_in 'admin_scheduleName', with: 'Fall 2021'
    fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
    fill_in 'admin_timeRange', with: '8:00am-5:00pm'
    fill_in 'admin_interviewLength', with: '30min'
    fill_in 'admin_numBreaks', with: '3'
    fill_in 'admin_numRooms', with: '2'
    click_on 'Create Admin'
    click_on 'Back'
    click_on 'Destroy'
    expect(page).to have_content('Admin was successfully destroyed.')
  end


scenario 'Update Admin Page' do
  visit new_admin_path
  fill_in 'admin_scheduleName', with: 'Fall 2021'
  fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
  fill_in 'admin_timeRange', with: '8:00am-5:00pm'
  fill_in 'admin_interviewLength', with: '30min'
  fill_in 'admin_numBreaks', with: '3'
  fill_in 'admin_numRooms', with: '2'
  click_on 'Create Admin'
  click_on 'Back'
  click_on 'Edit Schedule'
  click_on 'Update Admin'
  expect(page).to have_content('Admin was successfully updated.')
  end

scenario 'Edit Interviewee' do
    visit new_admin_path
      fill_in 'admin_scheduleName', with: 'Fall 2021'
      fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
      fill_in 'admin_timeRange', with: '8:00am-5:00pm'
      fill_in 'admin_interviewLength', with: '30min'
      fill_in 'admin_numBreaks', with: '3'
      fill_in 'admin_numRooms', with: '2'
      click_on 'Create Admin'
      click_on 'Back'
      click_on 'Edit Schedule'
      click_on 'Update Admin'
      expect(page).to have_content('Admin was successfully updated.')
  
      visit new_user_path
      fill_in 'user_name', with: 'David Tang'
      fill_in 'user_phoneNumber', with: '281-301-9696'
      fill_in 'user_email', with: 'davidtang@tamu.edu'
      choose('user_interviewDateTime_2021-10-07900am')
      click_on 'Submit'
  
      visit admins_path
      click_on 'Edit Interviewee'
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
        fill_in 'admin_timeRange', with: '8:00am-5:00pm'
        fill_in 'admin_interviewLength', with: '30min'
        fill_in 'admin_numBreaks', with: '3'
        fill_in 'admin_numRooms', with: '2'
        click_on 'Create Admin'
        click_on 'Back'
        click_on 'Edit Schedule'
        click_on 'Update Admin'
        expect(page).to have_content('Admin was successfully updated.')
        end
      
      scenario 'Destroy Interviewee' do
          visit new_admin_path
            fill_in 'admin_scheduleName', with: 'Fall 2021'
            fill_in 'admin_dateRange', with: '2021-10-05:2021-10-08'
            fill_in 'admin_timeRange', with: '8:00am-5:00pm'
            fill_in 'admin_interviewLength', with: '30min'
            fill_in 'admin_numBreaks', with: '3'
            fill_in 'admin_numRooms', with: '2'
            click_on 'Create Admin'
            click_on 'Back'
            click_on 'Edit Schedule'
            click_on 'Update Admin'
            expect(page).to have_content('Admin was successfully updated.')
        
            visit new_user_path
            fill_in 'user_name', with: 'David Tang'
            fill_in 'user_phoneNumber', with: '281-301-9696'
            fill_in 'user_email', with: 'davidtang@tamu.edu'
            choose('user_interviewDateTime_2021-10-07900am')
            click_on 'Submit'
            visit users_path
            visit admins_path
            puts page.body
            click_on 'Destroy Interviewee'
            
            end
      
end

