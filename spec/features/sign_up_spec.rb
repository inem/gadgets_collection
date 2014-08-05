require_relative '../rails_helper'

describe "the signup process", :type => :feature do
  it "redirects to sign up" do
    visit '/'
    expect(page).to have_content 'Sign up'
  end

  it "signs up" do
    visit '/users/sign_up'

    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    expect(page).to have_content 'Sign out'
  end

  it "logs in" do
    visit '/users/sign_in'
    sign_in

    expect(page).to have_content 'Sign out'
  end

  it "see navigation" do
    visit '/users/sign_in'
    sign_in

    expect(page).to have_content 'List'
    expect(page).to have_content 'Cover flow'
    expect(page).to have_content 'New gadget'
  end


  it "logs out" do
    visit '/users/sign_in'
    sign_in

    click_link 'Sign out'
    expect(page).to have_content 'Sign up'
  end
end

def sign_in(user = nil)
  unless user
    email = 'user@example.com'
    password = 'password'
    user = User.create(email: email, password: password)
  end

  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end