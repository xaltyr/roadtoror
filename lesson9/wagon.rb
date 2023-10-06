# frozen_string_literal: true

require_relative 'manufacturer'

class Wagon
  extend Manufacturer
  attr_reader :wagon_type, :number, :total_place, :used_place

  def initialize(wagon_type, number, total_place)
    @wagon_type = wagon_type
    @number = number
    @total_place = total_place
    @free_place = total_place
    @used_place = 0
  end

  def free_place
    @total_place - @used_place
  end
end
