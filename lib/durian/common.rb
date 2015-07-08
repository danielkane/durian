module Common
 
  def self.included(base)
    base.extend(Inheritables)
  end

  module Inheritables
    def inheritable_attributes(*args)
      @attributes ||= [:attributes]
      @attributes += args
      args.each do |arg|
        class_eval %(
      	  class << self; attr_accessor :#{arg} end
        )
      end
      @attributes
    end
    
   
    def inherited(base)
      @attributes.each do |attr|
        instance_var = "@#{attr}"
    	base.instance_variable_set(instance_var, instance_variable_get(instance_var))
      end
    end
  end
end
