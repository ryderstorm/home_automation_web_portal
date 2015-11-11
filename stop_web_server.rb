require 'colorize'

command = 'screen -X -S test_web_server quit'
puts 'Stopping web server with command:'.yellow
puts command.blue
result = system(command)
if result
  puts 'Sever stopped successfully!'.green
else
  puts 'There was an issue stopping the server!'.red
  puts 'You can stop the server manually by entering this command:'.yellow
  puts 'screen -r test_web_server'.cyan
  puts 'And pressing '.yellow + 'Ctrl+A'.blue + ' and then '.yellow + 'D'.blue
end
