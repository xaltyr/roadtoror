module InstanceCounter

  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module ClassMethods

    def instances
      @instances ||= 0
    end

    private

    def increase_instances=(val)
      @instances = val
    end
  end

  module InstanceMethods

    private

    def register_instance
      self.class.send(:increase_instances=, self.class.instances + 1)
    end
  end
end