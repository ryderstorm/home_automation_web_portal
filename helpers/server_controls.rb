require 'colorize'

def start_test_web_server
	command = ''
	if !ENV['OS'].nil? && ENV['OS'].include?('Windows')
		command << 'start '
	else
		command << 'screen -d -m -S test_web_server '
	end
	command << 'ruby website.rb'
	command << ' -p $PORT -o $IP' unless ENV['C9_HOSTNAME'].nil?

	Kernel.puts 'Starting web server with command:'.yellow
	Kernel.puts command.blue
	result = system(command)

	if result
	  Kernel.puts 'Server started successfully!'.green
	  # Kernel.puts 'To access the server screen, use the command:'.yellow
	  # Kernel.puts 'screen -r test_web_server'.cyan
	  return true
	else
	  Kernel.puts 'There was an issue starting the server!'.red
	  return false
	end
end

