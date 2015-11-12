require 'colorize'

def windows_os?
  !ENV['OS'].nil? && ENV['OS'].include?('Windows')
end

def start_test_web_server
  command = windows_os? ? 'start ' : 'screen -d -m -S test_web_server '
  command << 'ruby website.rb -p $PORT -o $IP' unless ENV['C9_HOSTNAME'].nil?

  Kernel.puts "Starting web server with command:\n".yellow + command.blue

  result = system(command)
  if result
    Kernel.puts 'Server started successfully!'.green
  else
    Kernel.puts 'There was an issue starting the server!'.red
  end
  result
end
