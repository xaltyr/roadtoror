class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    trains << train
  end

  def train_type_list(type)
    trains.select { |train| train.type == type }
  end

  def send_train(train)
    trains.delete(train)
  end
end

class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end

class Train
  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def stop
    @speed = 0
  end
  
  def go(speed)
    @speed = speed
  end

  def attach_wagon
    if @speed == 0
      @wagons += 1
    else
      puts "Поезд в движении!"
    end
  end

  def unhook_wagon
    if @speed == 0
      @wagons -= 1
    else
      puts "Поезд в движении!"
    end
  end

  def accept_route(route)
    @route = route
    @current_station_index = 0
    @train_route = @route.stations.first
  end

  def go_next_station
    if current_station != @route.stations.last
      @current_station_index += 1
    else
      puts "Поезд на конечной станции"
    end
  end

  def go_previous_station
    if current_station != @route.stations.first
      @current_station_index -= 1
    else
      puts "Поезд на начальной станции"
    end
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def previous_station
    @route.stations[@current_station_index - 1]
  end
end

