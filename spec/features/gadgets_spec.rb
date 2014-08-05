require_relative '../rails_helper'

describe "gadget", :type => :feature do
  let (:email) { "example@gmail.com" }
  let (:password) { "password" }
  let (:gadget_name) { "Gadget name" }
  let (:file_name) { "gadget.jpg" }

  before :each do
    user = User.find_by_email(email)
    unless user
      user = User.create(email: email, password: password)
    end

    visit '/users/sign_in'
    sign_in user
  end

  it "creates gadget" do
    visit '/'
    create_gadget gadget_name, file_name
    expect(page).to have_selector('.gadget', count: 1)

    create_gadget gadget_name, file_name
    expect(page).to have_selector('.gadget', count: 2)
  end

  it "sees gadget page" do
    visit '/'
    create_gadget gadget_name, file_name

    find(".gadget a").click

    expect(page).to have_content gadget_name
    expect(page).to have_selector('img', count: 1) #not very strict
  end

  it "switches mode of gadgets list" do
    visit '/'
    create_gadget gadget_name, file_name

    click_link "List"
    expect(page).to have_selector('ul li.gadget')

    click_link "Cover flow"
    expect(page).to have_selector('span.gadget')
  end

  it "mode stays the same after return from gadget" do
    visit '/'
    create_gadget gadget_name, file_name

    click_link "List"
    find("li a").click
    click_link "Back"

    expect(page).to have_selector('ul li.gadget')

    click_link "Cover flow"
    find(".gadget a").click
    click_link "Back"

    expect(page).to have_selector('span.gadget')
  end
end

