require 'colorize'

def windows_os?
  !ENV['OS'].nil? && ENV['OS'].include?('Windows')
end

def start_test_web_server
  command = windows_os? ? 'start ' : 'screen -d -m -S test_web_server '
  command << 'ruby website.rb'
  command << ' -p $PORT -o $IP' unless ENV['C9_HOSTNAME'].nil?

  Kernel.puts "Starting web server with command:\n".yellow + command.blue

  if system(command)
    Kernel.puts 'Server started successfully!'.green
    return true
  else
    Kernel.puts 'There was an issue starting the server!'.red
    return false
  end
end
