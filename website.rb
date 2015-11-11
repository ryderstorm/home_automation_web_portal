require 'sinatra'
require 'haml'
require 'require_all'
require 'sass'
require 'colorize'
require 'socket'
require_rel '/helpers'
puts "#{Time.now.ctime} | Starting webserver...".cyan

if Socket.gethostname == 'Alfred'
  @hue = create_hue_client
  @lights = @hue.lights
  set :port, 8000
  set :bind, '0.0.0.0'
  # TODO: add dummy light objects for testing/build out
end

sass_filename = 'public/css/styles.sass'
css_filename = 'public/css/styles.css'
css = Sass::Engine.for_file(sass_filename, {}).render
File.delete(css_filename) if File.exist?(css_filename)
File.open(css_filename, 'w') { |f| f.write(css) }

# use Rack::Auth::Basic, "Restricted Area" do |username, password|
#   username ==  and password ==
# end

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/lights' do
  haml :lights
end

get '/lights/all_off' do
  all_off
  redirect '/lights'
end

get '/test' do
  haml :test
end

get '/off/:id' do
  light = @lights[params[:ie].to_i - 1]
  puts "Turning off light [#{light.name}] | id: [#{params[:id]}]".yellow
  light.off!
  sleep 1
  redirect '/lights'
end

get '/on/:id' do
  light = @lights[params[:ie].to_i - 1]
  puts "Turning on light [#{light.name}] | id: [#{params[:id]}]".yellow
  light.on!
  sleep 1
  redirect '/lights'
end

get '/lights/all_full' do
  all_on_full
  redirect '/lights'
end

get '/lights/all_half' do
  all_on_half
  redirect '/lights'
end

get '/lights/all_dim' do
  all_on_dim
  redirect '/lights'
end

get '/form' do
  haml :form
end

get '/javascript_test' do
  haml :javascript_test
end

get '/hue_test' do
  haml :hue_test
end

post '/form' do
  # "You said '#{params[:message]}'"
  puts 'it worked!'
end

get '/terminate' do # only when testing?
  puts 'Shutting down Sinatra via /terminate route...'.light_red
  Sinatra::Application.quit!
end

not_found do
  halt 404, 'page not found'
end
