describe "the signup process", :type => :feature do
  # before :each do
  #   User.make(:email => 'user@example.com', :password => 'caplin')
  # end

  it "signs up" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end