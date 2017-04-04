# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist
#
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, timeout: 360)
# end

# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist

require 'capybara/webkit'
Capybara.javascript_driver = :webkit

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :firefox,
#     desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
#   )
# end