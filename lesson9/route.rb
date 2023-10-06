# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Route
  include Validation
  include InstanceCounter
  attr_reader :stations, :route_number

  @@all_instances = []
  validate :route_number, :presence
  validate :route_number, :type, Integer

  def initialize(start, finish, route_number)
    @stations = [start, finish]
    @route_number = route_number
    @@all_instances << self
    register_instance
    stations_validate!
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  protected

  def stations_validate!
  raise 'Маршрут должен содержать минимум две станции' if stations.first.nil? || stations.last.nil?
   end
end
