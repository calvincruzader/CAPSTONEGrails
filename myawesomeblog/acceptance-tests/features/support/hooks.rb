require 'watir-webdriver'
require 'page-object'
require 'byebug'
require 'date'

include PageObject::PageFactory

Before do
  @browser = Water::Browser.new :firefox
end

After do
  @browser.close 
end
