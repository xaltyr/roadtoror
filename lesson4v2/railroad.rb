class RailRoad
  attr_reader :trains, :routes, :stations

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def menu

    loop do
      puts "Введите соответствующий номер операции
          1 - Создание объекта(Станция/Поезд/Маршрут/Вагон)
          2 - Действия с маршрутом(Добавить/Удалить промежуточную станцию)
          3 - Назначить маршрут поезду
          4 - Добавить/Отцепить вагон от поезда
          5 - Переместить поезд по маршруту(Вперед/Назад)
          6 - Просмотреть список станций
          7 - Просмотреть список поездов на станции
          0 - Закрыть программу"

      choose = gets.chomp.to_i

      case choose
      when 1
        puts "Выберите действие
            1 - Создать станцию
            2 - Создать поезд
            3 - Создать маршрут(Если уже созданы 2 станции)"

        sub_choose = gets.chomp.to_i

        case sub_choose
        when 1
          puts "Введите имя станции"
          name = gets.chomp.to_s.capitalize
          create_station(name)

        when 2
          puts "Введите номер поезда"
          number = gets.to_i
          puts "Введите тип поезда (Passenger/Cargo)"
          type = gets.chomp.capitalize
          create_train(number, type)

        when 3
          puts "Введите начальную станцию"
          first = gets.chomp.to_s.capitalize
          puts "Введите конечную станцию"
          last = gets.chomp.to_s.capitalize
          puts "Введите номер маршрута"
          route_number = gets.chomp.to_i
          start = find_station(first)
          finish = find_station(last)
          create_route(start, finish, route_number)

        end

      when 2
        puts "Выберите действие
            1 - Добавить станцию
            2 - Удалить станцию"

        sub_choose = gets.chomp.to_i

        case sub_choose

        when 1
          puts "Введите станцию которую хотите добавить"
          station = gets.chomp
          @routes.first.add_station(find_station(station))
        when 2
          puts "Введите станцию которую хотите удалить"
          station = gets.chomp
          @routes.first.delete_station(find_station(station))
        end

      when 3
        puts "Введите номер поезда"
        train_number = gets.chomp.to_i
        puts "Введите номер маршрута"
        route_number = gets.chomp.to_i
        train = find_train(train_number)
        route = find_route(route_number)
        train.accept_route(route)

      when 4
        puts "Введите номер поезда"
        train_number = gets.chomp.to_i
        train = find_train(train_number)
        puts "Выберите действие
            1 - Добавить вагон
            2 - Отцепить вагон"

        sub_choose = gets.chomp.to_i

        case sub_choose
        when 1
          train.attach_wagon
        when 2
          train.dispatch_wagon
        end

      when 5
        puts "Введите номер поезда"
        number = gets.chomp.to_i
        puts "Введите действие
            1 - Отправить поезд вперед по маршруту
            2 - Отправить поезд назад по маршруту"

        sub_choose = gets.chomp.to_i

        case sub_choose
        when 1
          find_train(number).go_next_station

        when 2
          find_train(number).go_previous_station

        end

      when 6
        puts "#{self.stations}"

      when 7
        puts "Введите имя станции"
        name = gets.chomp.to_s.capitalize
        station = self.find_station(name)
        puts "#{station.trains}"

      when 0
        break

      end
    end
  end

  # Вспомогательные методы, при вызове некоторых без наличия определенных объектов будет ошибка

  private

  def create_station(name)
    station = Station.new(name)
    @stations << station
  end

  def create_train(number, type)
    case type
    when "Passenger"
      train = PassengerTrain.new(number)
      @trains << train
    when "Cargo"
      train = CargoTrain.new(number)
      @trains << train
    end
  end

  def create_route(start, finish, route_number)
    route = Route.new(start, finish, route_number)
    @routes << route
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






