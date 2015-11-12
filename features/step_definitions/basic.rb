Given(/^I am on the homepage$/) do
  expect(@browser.goto(@url)).to eq @url
  expect(@browser.title).to eq 'STORMHOLD'
end

Then(/^the header should be (.*)$/) do |header|
  expect(@browser.h1.text).to eq header
end

And(/^the sub\-header should be (.*)$/) do |sub_header|
  expect(@browser.h2.text).to eq sub_header
end
