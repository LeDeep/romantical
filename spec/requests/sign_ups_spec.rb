require 'spec_helper'

feature 'Sign up' do
  let(:user) {FactoryGirl.build(:user)}
  scenario "creates a user and logs him/her in" do
    visit new_user_registration_path
    fill_in "user_username", :with => user.username
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    click_button "Sign up"
    page.should have_content 'Welcome! You have signed up successfully.'
  end
end

feature 'invalid sign up' do 
  let(:user) {FactoryGirl.build(:user)}
  scenario "won't sign up a user with out the email address" do
    visit new_user_registration_path
    fill_in "user_username", :with => user.username
    fill_in "user_email", :with => ""
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    click_button "Sign up"
    page.should have_content "Email can't be blank"
  end
end


feature 'Sign in' do
  let(:user) {FactoryGirl.create(:user)}
  scenario "Signs in a user" do
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    page.should have_content 'Signed in successfully.'
  end
end

feature 'invalid sign in' do 
  let(:user) {FactoryGirl.create(:user)}
  scenario "won't sign in a user without a valid username" do
    visit new_user_session_path
    fill_in "user_username", :with => "incorrect"
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    page.should have_content 'Invalid username or password.'
  end
end

feature 'Sign out' do
  let(:user) {FactoryGirl.create(:user)}
  scenario "Signs out a user" do
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Logout"
    page.should have_content 'Signed out successfully.'
  end
end

feature 'Edit User' do 
  let(:user) {FactoryGirl.create(:user)}
  # let(:user) {FactoryGirl.build(:user)}
  scenario "it edits a users email address" do
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Edit User"
    fill_in "user_username", :with => "Billiam"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    fill_in "user_current_password", :with => user.password
    click_button "Update"
    page.should have_content 'You updated your account successfully.'
  end

  scenario "won't update a user's password if it is less than 8 characters" do 
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Edit User"
    fill_in "user_username", :with => "Billiam"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "ddd"
    fill_in "user_password_confirmation", :with => "ddd"
    fill_in "user_current_password", :with => user.password
    click_button "Update"
    page.should have_content 'Password is too short (minimum is 8 characters)'
  end

  scenario "won't update a user's password if password and password confirmation don't match" do 
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Edit User"
    fill_in "user_username", :with => "Billiam"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => "asklhdfkashfs"
    fill_in "user_password_confirmation", :with => "weoruewore"
    fill_in "user_current_password", :with => user.password
    click_button "Update"
    page.should have_content "Password doesn't match confirmation"
  end

  scenario "won't update a user's password if current password is not entered" do 
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Edit User"
    fill_in "user_username", :with => "Billiam"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    fill_in "user_current_password", :with => ''
    click_button "Update"
    page.should have_content "Current password can't be blank"
  end

  scenario "won't update a user's password if incorrect current password is entered" do 
    visit new_user_session_path
    fill_in "user_username", :with => user.username
    fill_in "user_password", :with => user.password
    click_button "Sign in"
    click_link "Edit User"
    fill_in "user_username", :with => "Billiam"
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_password_confirmation", :with => user.password_confirmation
    fill_in "user_current_password", :with => '23wewrwr2e234'
    click_button "Update"
    page.should have_content "Current password is invalid"
  end
end

# feature 'Edit Profile' do 
#   let(:user) {FactoryGirl.create(:user)}
#   # let(:profile) {FactoryGirl.create(:profile)}
#   scenario "it edits a users profile with a different name" do
#     visit new_user_session_path
#     fill_in "user_username", :with => user.username
#     fill_in "user_password", :with => user.password
#     click_button "Sign in"
#     click_link "Edit User"
#     fill_in "profile_name", :with => "Billiam"
#     fill_in "profile_points", :with => profile.points
#     fill_in "profile_gender", :with => profile.gender
#     fill_in "profile_in_relationship_with", :with => profile.in_relationship_with
#     fill_in "profile_relationship_status", :with => profile.relationship_status
#     fill_in "profile_anniversary", :with => profile.anniversary
#     fill_in "profile_age", :with => profile.age
#     fill_in "profile_city", :with => profile.city
#     fill_in "profile_state", :with => profile.state
#     click_button "Update Profile"
#     page.should have_content 'You updated your profile successfully.'
#   end

#   scenario "won't update a user's profile if its name field is empty" do 
#     visit new_user_session_path
#     fill_in "user_username", :with => user.username
#     fill_in "user_password", :with => user.password
#     click_button "Sign in"
#     click_link "Edit Profile"
#     fill_in "profile_name", :with => ""
#     fill_in "profile_points", :with => profile.points
#     fill_in "profile_gender", :with => profile.gender
#     fill_in "profile_in_relationship_with", :with => profile.in_relationship_with
#     fill_in "profile_relationship_status", :with => profile.relationship_status
#     fill_in "profile_anniversary", :with => profile.anniversary
#     fill_in "profile_age", :with => profile.age
#     fill_in "profile_city", :with => profile.city
#     fill_in "profile_state", :with => profile.state   
#     click_button "Update Profile"
#     page.should have_content 'Your profile was not updated - invalid input.'
#   end
# end
