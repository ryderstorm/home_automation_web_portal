# Home Automation Web Portal
A Ruby web server used to control the Hue lights, Nest thermostat, and other home automation tech via one easy to use website. 

Planned feature list:
- View and change Nest thermostat settings
- View and change settings for all the Hue lights in the house
- View webcam feeds from around the home
- Add an information portal for Airbnb guests with weather, local events/dining/news, and controls for the lights in the guest room.

### Windows Installation Instructions
1. Install [Ruby](http://rubyinstaller.org/)
2. Install [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
3. Install [Firefox](https://www.mozilla.org/en-US/firefox/new/)
4. Clone the repository to your computer by:
	1. Opening a command prompt
	2. Entering `cd C:`
	3. Entering `git clone https://github.com/ryderstorm/home_automation_web_portal.git`
	4. Enter `cd home_automation_web_portal`
5. Install the necessary gems(plugins) for Ruby by entering `bundle install`
6. Enter `ruby run_tests.rb` - this will run the tests that verify the website has the info it is supposed to and everything is working
7. Once those are complete, you can enter `ruby start_web_server.rb` to run the webserver. Then you can open your browser to [localhost:4567](http://localhost:4567) and see the webpage.
