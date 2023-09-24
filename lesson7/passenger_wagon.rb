class PassengerWagon < Wagon

  def initialize(seats,number)
    super(:Passenger,number, seats)
  end

  def take_seat
    raise "Места заняты" if @free_place - 1 < 0
    @used_place += 1
    end
  end
