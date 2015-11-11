# require 'socket'
require 'colorize'
report = "test_reports/web_portal_test_run_#{Time.now.strftime("%Y%m%d-%H%M%S")}.html"
command = "cucumber --format html --out #{report} --format pretty"
command.strip!
Kernel.puts "\n=========================================".yellow
Kernel.puts 'Starting tests with command:'.yellow
Kernel.puts command.green
system(command)
