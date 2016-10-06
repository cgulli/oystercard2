require_relative 'station'

class Journey

MIN_FARE = 1
PEN_FARE = 6
attr_reader :start_station, :end_station

  def start(station)
    @start_station = station
  end

  def end(station)
    @end_station = station
  end

  def calculate_fare
    completed? ? MIN_FARE : PEN_FARE
  end

private
  def completed?
    @start_station && @end_station
  end


end





# def initialize(start_station)
#   @journey = [start_station]
# end
