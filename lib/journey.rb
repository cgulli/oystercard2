require_relative 'station'

class Journey
  attr_accessor :journey
  
  def initialize(start_station)
    @journey = [start_station]
  end

  def end(station)
    @journey[1] = station
  end

end
