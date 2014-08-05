module FeatureHelpers
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

  def create_gadget name, file_name
    click_link 'New gadget'
    fill_in 'Name', :with => name
    attach_file('Image', "#{Rails.root}/spec/fixtures/#{file_name}")
    click_button 'Create'
  end

end