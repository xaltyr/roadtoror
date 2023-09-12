require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :stations, :route_number
  @@all_instances = []

  def initialize(start, finish, route_number)
    @stations = [start, finish]
    @route_number = route_number
    @@all_instances << self
    register_instance
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end
end