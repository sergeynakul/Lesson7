class CargoCarriage
  include Produser
  attr_reader :type
  def initialize
    @type = :cargo
  end
end
