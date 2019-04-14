class Route
  include InstanceCounter
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!(start_station, end_station)
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

  def valid?
    validate!(@stations[0], @stations[-1])
    true
  rescue
    false
  end

  private
  def validate!(start_station, end_station)
    raise "Маршрут не может быть без станции отправления" if start_station.empty?
    raise "Маршрут не может быть без станции назначения" if end_station.empty?
    raise "Начальная станция не может быть конечной" if start_station == end_station
  end

  def check_station(station) # клиенту не нужно его вызывать, вызывается из метода delete_station
    station != @stations.first && station != @stations.last
  end
end
