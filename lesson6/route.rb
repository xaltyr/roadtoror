require_relative 'instance_counter'
require_relative 'valid'

class Route
  include InstanceCounter, Valid
  attr_reader :stations, :route_number
  @@all_instances = []

  def initialize(start, finish, route_number)
    @stations = [start, finish]
    @route_number = route_number
    register_instance
    validate!
    @@all_instances << self
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  protected

  def validate!
    raise "Маршрут должен содержать минимум две станции" if stations.first.nil? || stations.last.nil?
  end
end
