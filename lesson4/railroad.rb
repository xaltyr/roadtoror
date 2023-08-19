# encoding: utf-8
class RailRoad
  attr_reader :trains, :stations

  def initialize
    @trains = []
    @stations = []
    @routes = []
    @wagons = []
  end
  #описаны в интерфейсе
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

  def create_route(start, finish)
    route = Route.new(start, finish)
    @routes << route
    end
  #вспомогательные методы что бы достать обьект из массива
  def find_station(name)
    @stations.find { |station| station.name == name }
  end

  def find_train(number)
    @trains.find { |train| train.number == number }
  end
  #интерфейс пользователя
  public
  def menu
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

      choose = gets.chomp.to_i

      case choose
      when 1
        puts "Введите имя станции"
        name = gets.encode("UTF-8").chomp.to_s
        create_station(name)

      when 2
        puts "Введите номер поезда"
        number = gets.encode.to_i
        puts "Введите тип поезда (Passenger/Cargo)"
        type = gets.chomp.capitalize
        create_train(number, type)

      when 3
        puts "Введите начальную станцию"
        first = gets.chomp.to_s
        puts "Введите конечную станцию"
        last = gets.chomp.to_s
        start = find_station(first)
        finish = find_station(last)
        create_route(start, finish)

      when 4
        puts "Введите тип вагона"
        type = gets.chomp.capitalize
        create_wagon(type)

      end
    when 2
      puts "Выберите действие
            1 - Добавить станцию
            2 - Удалить станцию"

      choose = gets.chomp.to_i
      case choose
      when 1
        puts "Введите станцию которую хотите добавить"
        station = gets.chomp
        @route.first.add_station(find_station(station))
      when 2
        puts "Введите станцию которую хотите удалить"
        station = gets.chomp
        @route.first.delete_station(find_station(station))
      end

    when 3
      puts "Введите номер поезда"
      train_number = gets.chomp.to_i
      train = find_train(train_number)
      train.accept_route(@routes.first)

    when 4
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

    when 5
      puts "Введите номер поезда"
      number = gets.chomp.to_i
      puts "Введите действие
            1 - Отправить поезд вперед по маршруту
            2 - Отправить поезд назад по маршруту"

      choose = gets.chomp.to_i
      case choose
      when 1
        find_train(number).go_forward

      when 2
        find_train(number).go_back

      end
    when 6
      stations
    when 7
      puts "Введите имя станции"
      name = gets.chomp.capitalize
      find_station(name).trains

    end
  end
  # метод для меня
  def seed
    @stations << prima = Station.new("Prima")
    @stations << komenda = Station.new("Komenda")
    @stations << vaska = Station.new("Vaska")
    @trains << train = CargoTrain.new(1)
    route = Route.new(prima,vaska)
    @routes << route
    prima.accept_train(train)
    train.accept_route(route)

  end

end





