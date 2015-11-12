Given(/^I am on the homepage$/) do
  expect(@browser.goto(@url)).to eq @url
  expect(@browser.title).to eq 'STORMHOLD'
end

Then(/^the header should be (.*)$/) do |header|
  expect(@browser.div(id: 'header').h1.text).to eq header
end

Then(/^the sub\-header should be (.*)$/) do |sub_header|
  expect(@browser.div(id: 'header').h2.text).to eq sub_header
end

Then(/^the Nav List should include (.*)$/) do |list_item|
  all_items = @browser.div(id: 'side_bar').ul.lis.collect(&:text).to_s
  expect(all_items).to include(list_item)
end
