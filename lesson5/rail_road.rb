require_relative 'constants'

class RailRoad
  attr_reader :trains, :routes, :stations

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def menu
    loop do

    puts MENU
    choose = gets.chomp.to_i
    break if choose == 0

    send(ACTION_MAPPING[choose])
    end
  end

  private

  def create_obj
    puts SELECT_ACTION
    choose = gets.chomp.to_i

    case choose

    when 1
      create_station

    when 2
      create_train

    when 3
      create_route
    end
  end

  def create_station
    puts "Введите имя станции"
    name = gets.chomp.to_s.capitalize
    station = Station.new(name)
    @stations << station
  end

  def create_train
    puts "Введите номер поезда"
    number = gets.to_i

    puts "Введите тип поезда (Passenger/Cargo)"
    type = gets.chomp.capitalize

    case type

    when "Passenger"
      train = PassengerTrain.new(number)
      @trains << train
    when "Cargo"
      train = CargoTrain.new(number)
      @trains << train
    end
    end

    def create_route
      puts "Введите начальную станцию"

      first = gets.chomp.to_s.capitalize

      puts "Введите конечную станцию"

      last = gets.chomp.to_s.capitalize

      puts "Введите номер маршрута"

      route_number = gets.chomp.to_i
      start = find_station(first)
      finish = find_station(last)
      route = Route.new(start, finish, route_number)
      @routes << route
  end


  def route_action
    puts "Введите номер маршрута"

    route_number = gets.chomp.to_i

    puts "Выберите действие
            1 - Добавить станцию
            2 - Удалить станцию"

    choose = gets.chomp.to_i

    case choose

    when 1
      puts "Введите станцию которую хотите добавить"

      station = gets.chomp.to_s.capitalize
      find_route(route_number).add_station(find_station(station))
    when 2
      puts "Введите станцию которую хотите удалить"

      station = gets.chomp.to_s.capitalize
      find_route(route_number).delete_station(find_station(station))
    end

  end

  def route_accept
    puts "Введите номер поезда"

    train_number = gets.chomp.to_i

    puts "Введите номер маршрута"

    route_number = gets.chomp.to_i
    train = find_train(train_number)
    route = find_route(route_number)
    train.accept_route(route)
  end

  def wagon_attach
    puts "Введите номер поезда"

    train_number = gets.chomp.to_i
    train = find_train(train_number)
    puts "Выберите действие
            1 - Добавить вагон
            2 - Отцепить вагон"

    choose = gets.chomp.to_i

    case choose

    when 1
      train.attach_wagon
    when 2
      train.dispatch_wagon
    end
  end

  def train_move
    puts "Введите номер поезда"

    number = gets.chomp.to_i

    puts "Введите действие
            1 - Отправить поезд вперед по маршруту
            2 - Отправить поезд назад по маршруту"

    choose = gets.chomp.to_i

    case choose

    when 1
      find_train(number).go_next_station

    when 2
      find_train(number).go_previous_station
    end
  end

  def station_list
    puts "#{self.stations}"
  end

  def trains_list
    puts "Введите имя станции"

    name = gets.chomp.to_s.capitalize
    station = self.find_station(name)

    puts "#{station.trains}"
  end

  def find_station(name)
    @stations.find { |station| station.name == name }
  end

  def find_train(number)
    @trains.find { |train| train.number == number }
  end

  def find_route(route_number)
    @routes.find { |route| route.route_number == route_number }
  end
end