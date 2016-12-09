require 'watir-webdriver'
require 'page-object'
require 'byebug'
require 'date'
require 'BetterLorem' #taken from https://github.com/caedmonjudd

###
#BetterLorem.p(<number of paragraphs>, <plain text?>, <exclude trailing period?>)
#example :
#BetterLorem.p(10, true, false) gives 10 lorem ipsum paragraphs, has plain text, and has a trailing period
###

include PageObject::PageFactory

Before do
  @browser = Watir::Browser.new :firefox
end

After do
  @browser.close
end
