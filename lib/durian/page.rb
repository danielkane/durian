require 'common'

module Durian
  class Page
    include Common
    inheritable_attributes :location
    alias_method :located_at, :location=
    
    # Allows Page Object class's to inherit from Durian::Page class 
    def inherited(base)
      base.instance_variable_set :@elements, Hash.new { |hash, key, value| hash[key] = [] }
    end
    
    # Call page objects and elements with the page[element].click syntax
    def [](key)
      send(key)
    end
      
    def for(name)
      page = "#{name}Page".classify
      page.constantize rescue raise "Could not find page #{page}"
    end   
  end
end

