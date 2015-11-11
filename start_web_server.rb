require 'colorize'

command = 'screen -d -m -S test_web_server ruby website.rb'

unless ENV['C9_HOSTNAME'].nil?
  command << ' -p $PORT -o $IP'
end

Kernel.puts 'Starting web server with command:'.yellow
Kernel.puts command.blue

result = system(command)

if result 
  Kernel.puts 'Server started successfully!'.green
  Kernel.puts 'To access the server screen, use the command:'.yellow
  Kernel.puts 'screen -r test_web_server'.cyan
else
  Kernel.puts 'There was an issue starting the server!'.red
end
