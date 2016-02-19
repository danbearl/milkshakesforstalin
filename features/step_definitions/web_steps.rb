Given /^I am on the posts index page$/ do
  visit posts_path
end

Given /^that user is logged in$/ do
  visit "/log_in/"

  fill_in "Email", :with => @user.email
  fill_in "Password", :with => "pass"

  click_button "Log In"
end

Given /^I am on that recipe's page$/ do
  visit recipe_path(@recipe)
end

Given /^I am on the home page$/ do
  visit root_path
end

Given /^I am on the log in page$/ do
  visit log_in_path
end

When /^I follow "(.*?)"$/ do |link|
  click_link(link)
end

When /^I fill in the following:?/ do |form|
  rows = form.raw

  rows.each do |r|
    fill_in r[0], :with => r[1]
  end
end

When /^I press "(.*?)"$/ do |action|
  click_button action
end

When /^I accept the confirmation$/ do
  page.driver.browser.switch_to.alert.accept
end

Then /^I should see "(.*?)"$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  expect(page).to have_no_content(text)
end
