class Oystercard
 attr_reader :balance, :max_balance, :min_fare, :entry_station
 MAX_BALANCE = 90
 MIN_FARE = 2

 def initialize(balance = 0)
   @balance = balance
   @max_balance = MAX_BALANCE
   @min_fare = MIN_FARE
   @entry_station = nil
 end

 def top_up(top_up_value)
   raise "Maximum balance of 90 exceeded" if top_up_value + @balance > @max_balance
   @balance += top_up_value
 end

 def touch_in(station)
   raise "Insufficient balance" if @balance < @min_fare
   @entry_station = station

 end

 def touch_out
   deduct(@min_fare)
   @entry_station = nil
 end

 def in_journey?
   @entry_station != nil
 end


 def deduct(top_up_value)
   @balance -= top_up_value
 end

 private :deduct

end
