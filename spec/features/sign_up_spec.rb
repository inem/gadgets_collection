require_relative '../rails_helper'

describe "the signup process", :type => :feature do
  it "signs up & signs in & signs" do
    visit '/'
    expect(page).to have_content 'Sign up'
    click_link 'Sign up'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'


    click_link 'Sign out'
    expect(page).to have_content 'Sign up'


    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Sign out'

    click_link 'Sign out'
    expect(page).to have_content 'Sign up'
  end
end