Given(/^I am logged in as an admin$/) do
  visit('/root')
  fill_in('Username', with: '<AdminUserName>')
  fill_in('Password', with: '<AdminPassword>')
  click('Login')
end

Given(/^I have a CSV file of user data$/) do
  @data = []
  CSV.foreach("./user_data.csv", headers: true) do |row|
    @data << row
  end
end

When(/^I go to the new user form page$/) do
  click('Setup')
  click('Security')
  click('Users')
  click('New User')
end

When(/^I fill in the new user form$/) do
  @data.each do |row|
    fill_in('user_login', with: "#{row[:username]}")
    fill_in('user_password', with: "#{row[:password]}")
    fill_in('user_password_confirmation', with: "#{row[:password]}")
    fill_in('user_email', with: "#{row[:email]}")
    fill_in('user_firstname', with: "#{row[:firstname]}")
    fill_in('user_lastname', with: "#{row[:lastname]}")
    find(:css, "#user_role_ids_[value=\'#{value_for(row[:role])}\']").set(true)
    click('Create')
    click('New User')
  end
end

When(/^I go to the users page$/) do
  click('Users')
end

Then(/^those users should exist$/) do
  @data.each do |row|
    fill_in('query', with: "#{row[:username]}")
    click('Search')
    expect(page).to_have content("#{row[:firstname]}")
    expect(page).to_have content("#{row[:lastname]}")
    expect(page).to_have content("#{row[:email]}")
    click('Clear Results')
  end
end
