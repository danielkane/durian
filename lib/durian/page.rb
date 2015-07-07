module Durian
  class Page
    # The url(can be relative) of the page
    attr_accessor :location
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
      class_name = "#{name}_page".gsub(' ', '_').classify
      class_name.constantize rescue raise "Could not find page #{class_name}"
    end   
  end
end

