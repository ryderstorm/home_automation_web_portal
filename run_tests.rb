# require 'socket'
require 'colorize'
Dir.mkdir('test_reports') unless Dir.exist?('test_reports')
timestamp = Time.now.strftime('%Y%m%d-%H%M%S')
report = "test_reports/web_portal_test_run_#{timestamp}.html"
command = "cucumber --format html --out #{report} --format pretty"
command.strip!
Kernel.puts "\n=========================================".yellow
Kernel.puts 'Starting tests with command:'.yellow
Kernel.puts command.green
system(command)
