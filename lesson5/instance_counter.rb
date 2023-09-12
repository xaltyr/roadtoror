module InstanceCounter

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods

    def instances
      @instances ||= 0
    end

    private

    def instance=(val)
      @instance = val
    end
  end

  module InstanceMethods
    
  private
    
    def register_instance
      self.class.send(:increase_instances=, self.class.instances + 1)
    end
  end
end
