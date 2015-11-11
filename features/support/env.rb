require 'socket'
require 'watir-webdriver'
require 'rspec/expectations'
# require 'pry'

case
when !ENV['C9_HOSTNAME'].nil?
  Kernel.puts 'Running tests on Cloud9'
  url = 'https://home-automation-web-portal-ryderstorm.c9users.io/?_c9_id=livepreview6&_c9_host=https://ide.c9.io'
  require 'headless'
  Kernel.puts 'Starting headless...'
  headless = Headless.new
  headless.start
  load 'start_web_server.rb'
when Socket.gethostname == 'Alfred'
  Kernel.puts 'Running tests on Alfred'
  url = 'http://192.168.1.10:8000'
  # TODO: add code to restart the web server daemon
else
  Kernel.puts 'Running tests on local host'
  url = 'http://localhost:4567'
  load 'start_web_server.rb'
end

Kernel.puts 'Starting browser...'
browser = Watir::Browser.new :firefox

Before do
  @browser = browser
  @url = url
end

at_exit do
  browser.close
  headless.destroy unless headless.nil?
  load 'stop_web_server.rb' unless ENV['ALFRED']
end
