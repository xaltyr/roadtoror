module Validation
  def self.included(base)
    base.extend(ClassMethods)
    base.include(InstanceMethods)
  end

  module ClassMethods
    attr_accessor :validations, :errors

    def validate(attribute, type, options = [])
      @validations ||= []
      @validations << { attribute: attribute, type: type, options: options }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each do |validation|
        attribute = validation[:attribute]
        type = validation[:type]
        options = validation[:options]
        attribute_value = public_send(attribute)
        send("validate_#{type}", attribute, attribute_value, *options)
      end
    end

    def valid?
      validate!
      true
    rescue StandardError => e
      puts e.inspect
      false
    end

    private

    def validate_format(attribute, attribute_value, expected_format)
      raise "#{attribute}: Неверный формат" if attribute_value !~ expected_format
    end

    def validate_presence(attribute,attribute_value)
      raise "#{attribute}: Имя не может быть пустым или nil" if attribute_value.nil? || attribute_value.to_s.empty?
    end

    def validate_type(attribute, attribute_value, expected_class)
      raise "#{attribute}: Неверный тип" unless attribute_value.is_a?(expected_class)
    end
  end
end

class User
  include Validation

  attr_accessor :name, :number

  validate :name, :type, String
  validate :number, :format, /^[a-z0-9]{3}-{0,1}[a-z0-9]{2}$/
  validate :name, :presence
end