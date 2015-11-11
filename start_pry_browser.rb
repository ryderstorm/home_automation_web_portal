require 'watir-webdriver'
require 'headless'
require 'pry'

# define the screenshot function
def take_screenshot(text = 'screenshot')
  time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
  @browser.screenshot.save "./screenshots/#{text}_#{time}.png"
end

unless ENV['C9_HOSTNAME'].nil?
	puts 'Creating headless instance'
	headless = Headless.new
	headless.start
end

puts 'Creating browser instance'
browser = Watir::Browser.new :firefox
@browser = browser

puts 'Browser created successfully!'
binding.pry # rubocop:disable all

puts 'Closing browser...'
browser.close
