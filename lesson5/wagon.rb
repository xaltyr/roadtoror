require_relative 'manufacturer'

class Wagon
  include Manufacturer
  attr_reader :wagon_type

  def initialize(wagon_type)
    @number = wagon_type
  end
end
