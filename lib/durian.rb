require "durian/version"
require "selenium-webdriver"
require "rubygems"
require "durian/page"

module Durian
    class << self
        def driver
            @driver ||= Selenium::WebDriver.for :firefox  #Default driver
        end
    end
end



