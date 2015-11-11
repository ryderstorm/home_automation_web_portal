Given(/^I am on the homepage$/) do
  expect(@browser.goto(@url)).to eq @url
  expect(@browser.title).to eq 'STORMHOLD'
end

Then(/^the title should include Stormhold$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

And(/^the sub\-title should include Welcome to the Storm Family Home$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
