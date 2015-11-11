require 'socket'
require 'colorize'
require 'watir-webdriver'
require 'rspec/expectations'
require 'require_all'
require_rel '../../helpers/server_controls'
# require 'pry'

case
when !ENV['C9_HOSTNAME'].nil?
  Kernel.puts 'Running tests on Cloud9'
  # url = 'https://home-automation-web-portal-ryderstorm.c9users.io/?_c9_id=livepreview6&_c9_host=https://ide.c9.io'
  url = 'https://home-automation-web-portal-ryderstorm.c9users.io'
  require 'headless'
  Kernel.puts 'Starting headless...'
  headless = Headless.new
  headless.start
  start_test_web_server
when Socket.gethostname == 'Alfred'
  Kernel.puts 'Running tests on Alfred'
  url = 'http://192.168.1.10:8000'
  # TODO: add code to restart the web server daemon
else
  Kernel.puts 'Running tests on local host'
  url = 'http://localhost:4567'
  start_test_web_server
end
Kernel.puts 'Starting browser...'
Kernel.puts "Using url: #{url.yellow}"
browser = Watir::Browser.new :firefox

Before do
  @browser = browser
  @url = url
end

at_exit do
  browser.goto(url + '/terminate') unless ENV['ALFRED']
  browser.close
  headless.destroy unless headless.nil?
  # load 'stop_web_server.rb' unless ENV['ALFRED']
  # @server.kill unless ENV['ALFRED']
end
