require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'valid'

class Train
  attr_reader :number, :speed, :type, :wagons, :route
  extend Manufacturer
  include InstanceCounter
  include Valid
  @@all_instances = []
  REGEXP = /^[a-z0-9]{3}[-]{0,1}[a-z0-9]{2}$/

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@all_instances << self
    register_instance
    begin
      validate!
      puts "Создан поезд #{self.number}"
    rescue StandardError => e
      puts "Ошибка: #{e.message}"
      puts "Введите корректный номер поезда"
      number = gets.chomp
      puts "Создан поезд #{self.number}"
      retry if number !~ REGEXP
    end
  end

  def stop
    @speed = 0
  end

  def go(speed)
    @speed = speed
  end

  def attach_wagon
    raise "Поезд на ходу!" if @speed > 0
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
      raise "Поезд на конечной станции"
    end
  end

  def go_previous_station
    if current_station != @route.stations.first
      @current_station_index -= 1
      current_station.accept_train(self)
      previous_station.send_train(self)

    else
      raise "Поезд на начальной станции"
    end
  end

  def self.find(number)
    @@all_instances.find { |train| train.number == number }
  end

  protected

  def validate!
    raise "Неправильный формат номера" if number !~ REGEXP
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
