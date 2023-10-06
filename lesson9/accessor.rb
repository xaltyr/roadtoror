# frozen_string_literal: true

module Accessors
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
      define_method(attribute) do
        instance_variable_get("@#{attribute}")
      end
      define_method("#{attribute}=") do |value|
        instance_variable_set("@#{attribute}", value)
        history_variable = "@#{attribute}_history"
        history = instance_variable_get(history_variable) || []
        history << value
        instance_variable_set(history_variable, history)
      end

      define_method("#{attribute}_history") do
        instance_variable_get("@#{attribute}_history")
      end
    end
  end

  def strong_attr_accessor(attribute, class_attribute)
    define_method("#{attribute}") do
      instance_variable_get("@#{attribute}")
    end
    define_method("#{attribute}=") do |value|
      if value.class == class_attribute
        instance_variable_set("@#{attribute}", value)
      else
        raise "Неправильный тип"
      end
    end
  end
end

class Test
  extend Accessors
  attr_accessor_with_history :my_attr, :a, :c
  strong_attr_accessor :attr, Integer
end