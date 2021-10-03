# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating an appoinment!', type: :feature do
    scenario 'valid xyz....' do

    visit new_user_path
    print "---------new user page------------\n"
    print page.body
    print "---------new user page------------\n"

    fill_in 'user_name', with: 'harry potter'
    fill_in 'user_phoneNumber', with: '007'
    fill_in 'user_email', with: 'harry_potter@tamu.edu'
    fill_in 'user_interviewDate', with: '01/02/2021'
    click_on 'Create User'
    
    visit @user

    print "---------@user page start------------\n"
    print page.body
    print "---------@user page end------------\n"
    
    expect(page).to have_content('harry potter')
    end
end