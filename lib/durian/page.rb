class Durian
    class Page
        class << self
        |   # The url(can be relative) of the page
        |   attr_accessor :location
        |   alias_method :location_at, :location=
        |   #def initialize
        |   #    @location = ""
        |   #end
        |       #Call page objects and elements with the page[element].click syntax

        |   def inherited(base)
                |   base.instance_variable_set :@elements, Hash.new { |hash, key, value| hash[key] = [] }
        |   end

        |   def [](key)
        |       |send(key)
        |   end

        |   def for(name)
        |       |class_name = "#{name}_page".gsub(' ', '_').classify
        |       |class_name.constantize rescue raise "Could not find page #{class_name}"
        |   end

        |   def located_at(url)
                self.location = url
        |   end
        end
    end
end

