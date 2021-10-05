# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an appoinment!', type: :feature do
    scenario 'Valid Interviewee Page' do
        visit new_user_path
        fill_in 'user_name', with: 'harry potter'
        fill_in 'user_phoneNumber', with: '007'
        fill_in 'user_email', with: 'harry_potter@tamu.edu'
        fill_in 'user_interviewDate', with: '01/02/2021'
        click_on 'Create User'
        visit @user
        expect(page).to have_content('harry potter')
        expect(page).to have_content('007')
        expect(page).to have_content('harry_potter@tamu.edu')
        expect(page).to have_content('2021-02-01')
    end
    



    scenario 'Valid Admin Page' do
        visit new_admin_path
        fill_in 'admin_scheduleName', with: 'Fall 2021' 
        fill_in 'admin_dateRange', with: '09/08/2021-09/29/2021' 
        fill_in 'admin_timeRange', with: '8:00am-3:00pm' 
        fill_in 'admin_interviewLength', with: '30min' 
        fill_in 'admin_numBreaks', with: '3' 
        click_on 'Create Admin'
        expect(page).to have_content('Fall 2021')
        expect(page).to have_content('09/08/2021-09/29/2021')
        expect(page).to have_content('8:00am-3:00pm')
        expect(page).to have_content('30min')
        expect(page).to have_content('3')
    end
end