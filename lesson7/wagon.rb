require_relative 'manufacturer'

class Wagon
  extend Manufacturer
  attr_reader :wagon_type, :number

  def initialize(wagon_type, number)
    @wagon_type = wagon_type
    @number = number
  end
end
