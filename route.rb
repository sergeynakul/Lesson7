class Route
  include InstanceCounter
  include Validation
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def delete_station(station)
    @stations.delete(station) if check_station(station)
  end

  def list_station
    @stations.each { |station| puts station.name }
  end

  private
  def validate!
    raise "Маршрут не может быть без станции отправления" if @stations[0].empty?
    raise "Маршрут не может быть без станции назначения" if @stations[-1].empty?
    raise "Начальная станция не может быть конечной" if @stations[0] == @stations[-1]
  end

  def check_station(station) # клиенту не нужно его вызывать, вызывается из метода delete_station
    station != @stations.first && station != @stations.last
  end
end
