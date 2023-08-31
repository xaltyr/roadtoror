MENU = "Введите соответствующий номер операции
          1 - Создание объекта(Станция/Поезд/Маршрут)
          2 - Действия с маршрутом(Добавить/Удалить промежуточную станцию)
          3 - Назначить маршрут поезду
          4 - Добавить/Отцепить вагон от поезда
          5 - Переместить поезд по маршруту(Вперед/Назад)
          6 - Просмотреть список станций
          7 - Просмотреть список поездов на станции
          0 - Закрыть программу"

SELECT_ACTION = "Выберите действие
            1 - Создать станцию
            2 - Создать поезд
            3 - Создать маршрут(Если уже созданы 2 станции)"

ACTION_MAPPING = {
  0 => :exit_menu,
  1 => :create_obj,
  2 => :route_action,
  3 => :route_accept,
  4 => :wagon_attach,
  5 => :train_move,
  6 => :station_list,
  7 => :trains_list
}
