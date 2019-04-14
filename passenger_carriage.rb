class PassengerCarriage
  include Produser
  attr_reader :type
  def initialize
    @type = :passenger
  end
end
