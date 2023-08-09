class Station 
	attr_reader :name, :trains, :trains_list, :trains_number_list
	def initialize(name)
	@name = name 
	@trains_number_list = []
	@trains = []
    end  

 	def accept_train(train)

 	if  @trains.empty?
 		@trains << train
 		@trains_number_list << train.number
 		puts "Поезд принят на станцию: #{@name}"
 	else 
 		puts "Станция занята"
 	end
 	end

    def trains_type_list(type)
    	puts "Поезда заданного типа на станции: #{@trains.select {|train| train.type == type}}" 
    	puts "Количество поездов заданного типа: #{@trains.count {|train| train.type == type}}"
    end 

    def train_dispatch_forward(train)
    	if trains.empty? 
    	puts "В станции нет поездов" 
    else
    	train.go_forward
    	@trains.delete(train)
    	@trains_number_list.delete(train.number)
    end
    end

    def train_dispatch_back(train)
    	if trains.empty? 
    	puts "В станции нет поездов" 
    else
    	train.go_back
    	@trains.delete(train)
    	@trains_number_list.delete(train.number)
    end
    end
    
end

class Route
	attr_reader :stations :stat_list
	def initialize(start, finish)
		@stations = [start, finish]
		@stat_list = []
		@stat_list << start.name
		@stat_list << finish.name

	end

	def add_station(station)
		@stations.insert(-2, station)
		@stat_list.insert(-2, station.name)
	end

	def delete_station(station)
		@stations.delete(station)
	end
	def station_list
		puts @stat_list
	end
	


end

class Train 
	attr_reader :number :type :speed
	
		@route = []
		@location = nil
	def initialize(number, type, wagons, speed = 0)
		@number = number
		@type = type
		@wagons = wagons
		@speed = speed	

	end

    def stop
    	@speed = 0
    end

    def go(speed)
    	@speed = speed
    end

    def current_speed
    	puts "Текущая скорость: #{@speed} км/ч "
    end

    def attach_wagon
    if @speed == 0 
       @wagons += 1 
    else 
    	puts "Поезд в движении!"
    end
    end

    def unhook_wagon
    if  @speed == 0 && @wagons != 0 
    	@wagons -= 1 
    else 
    	puts "Поезд в движении, либо отсутствуют вагоны!"
    end
    end

    def wagons
    	puts "Количество вагонов: #{@wagons}"
    end

   def previous_station
  if @route.nil?
    puts "Поезд не находится на маршруте"
    return
  end
  
  if @route.stations.include?(@location)
    previous_index_station = @route.stations.index(@location) - 1
    if previous_index_station >= 0 
      @previous_station = @route.stations[previous_index_station]
      puts "Предыдущая станция: #{@previous_station.name}"
    else 
      puts "Поезд на начальной станции"
    end
 
end
end

    def next_station
    if @route.nil?
        puts "Поезд не находится на маршруте"
        return
    end

    if  @route.stations.include?(@location)
    	next_index_station = @route.stations.index(@location) + 1
    if  next_index_station < @route.stations.length
    	@next_station = @route.stations[next_index_station]
    	puts "Следующая станция: #{@next_station.name}"
    	
    else 
    	puts "Поезд на конечной станции"
    end
    else 
    	puts "Поезд ненаходится на станций"
    end
    
end

    def location
    if  @route != nil
    	current_index_station = @route.stations.index(@location)
    if  current_index_station != nil
    	puts "Текущая станция: #{@location.name}"
    else
    
    	puts "Поезд не находится на станции" 
    end
    else puts "Поезд не имеет маршрута"
    end
end

    def accept_route(route)
    	@route = route
    	@location = route.stations.first
        @location.accept_train(self)

    end
    def show_route
    	@route.stations
    end

    def go_forward
    	current_index_station = @route.stations.index(@location)    	
    	if current_index_station != nil
    	next_index_station = current_index_station + 1
        @location = @route.stations[next_index_station]
        @location.accept_train(self)  
    else 
    	puts "Поезд достиг конечной станции"    
    end
    	

    end
    def go_back
    	current_index_station = @route.stations.index(@location)
    	if current_index_station != nil && current_index_station != 0
    		previous_station = current_index_station - 1    	
    		@location = @route.stations[previous_station]
    		@location.accept_train(self)
    	    else 
    		puts "Поезд на начальной станции"
    	end
   	   
    end
   
     
end


