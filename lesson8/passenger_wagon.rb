# frozen_string_literal: true

class PassengerWagon < Wagon
  def initialize(seats, number)
    super(:Passenger, seats, number)
  end

  def take_seat
    raise 'Места заняты' if (@free_place - 1).negative?

    @used_place += 1
  end
end
