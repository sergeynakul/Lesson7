class Station
  include InstanceCounter
  attr_reader :trains, :name
  @@stations = []
  
  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def list(type)
    @trains.select { |train| train.type == type }
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def self.all
    @@stations
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  private

  def validate!
    raise "Стания не может быть без названия" if name.empty?
  end
end
