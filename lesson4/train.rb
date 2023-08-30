class Train
  attr_reader :train_route, :number, :speed

  def stop
    @speed = 0
  end

  def go(speed)
    @speed = speed
  end

  def attach_wagon
    return "Поезд на ходу!" if @speed > 0
    if self.type == :cargo
      cargo_wagon = CargoWagon.new
      attach_wagon!(cargo_wagon)
    elsif self.type == :passenger
      passenger_wagon = PassengerWagon.new
      attach_wagon!(passenger_wagon)
    end
  end

  def dispatch_wagon
    wagons.delete_at(0)
  end

  def accept_route(route)
    @route = route
    @current_station_index = 0
    current_station.accept_train(self)
  end

  def go_next_station
    if current_station != @route.stations.last
      @current_station_index += 1
      current_station.accept_train(self)
      previous_station.send_train(self)

    else
      puts "Поезд на конечной станции"
    end
  end

  def go_previous_station
    if current_station != @route.stations.first
      @current_station_index -= 1
      current_station.accept_train(self)
      previous_station.send_train(self)

    else
      puts "Поезд на начальной станции"
    end
  end

  # Вспомогательный метод

  private

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end

  def attach_wagon!(wagon)
    wagons << wagon
  end
end
