class PassengerWagon < Wagon
  attr_reader :free_seats, :number

  def initialize(seats,number)
    @seats = seats
    @free_seats = seats
    super(:Passenger,number)
  end

  def take_seat
    if @free_seats - 1 < 0
      raise "Места заняты"
    else
      @free_seats -= 1
    end
  end

  def occupied_seats
    occupied_seats = @seats - free_seats
    occupied_seats
  end
end