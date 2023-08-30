class Route
  attr_reader :stations, :route_number

  def initialize(start, finish, route_number)
    @stations = [start, finish]
    @route_number = route_number
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end