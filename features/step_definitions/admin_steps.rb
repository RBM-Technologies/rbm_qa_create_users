Given(/^I have a CSV file of user data$/) do
  @data = []
  CSV.foreach("./user_data.csv", headers: true) do |row|
    @data << row
  end
end

Given(/^I have a CSV of RBM Admin credentials$/) do
  @admin_data = []
  CSV.foreach("./admin_data.csv", headers: true) do |row|
    @admin_data << row
  end
end

Given(/^I am logged in as an admin$/) do
  visit('/')
  fill_in('Username', with: @admin_data[0]['username'])
  fill_in('Password', with: @admin_data[0]['password'])
  click_on('Login')
end

When(/^I go to the new user form page$/) do
  visit('/setup')
  click_on('Security')
  click_on('Users')
  click_on('New User')
end

When(/^I fill in the new user form$/) do
  @data.each do |row|
    fill_in('user_login', with: row['username'])
    fill_in('user_password', with: row['password'])
    fill_in('user_password_confirmation', with: row['password'])
    fill_in('user_email', with: row['email'])
    fill_in('user_firstname', with: row['firstname'])
    fill_in('user_lastname', with: row['lastname'])
    find(:css, "#user_role_ids_[value='#{value_for(row['role'])}']").set(true)
    click_on('Create')
    click_on('New User')
  end
end

When(/^I go to the users page$/) do
  click_on('Users')
end

Then(/^those users should exist$/) do
  @data.each do |row|
    fill_in('query', with: "#{row['username']}")
    click_on('Search')
    expect(page).to have_content("#{row['firstname']}")
    expect(page).to have_content("#{row['lastname']}")
    expect(page).to have_content("#{row['email']}")
    click_on('Clear Results')
  end
end
