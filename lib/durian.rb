require "durian/version"
require "selenium-webdriver"
require "rubygems"

module Durian
    class << self
        def driver
            @driver ||= Selenium::WebDriver.for :firefox  #Default driver
        end
    end
end



