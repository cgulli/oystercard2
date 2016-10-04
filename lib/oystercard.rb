class Oystercard
 attr_reader :balance, :max_balance, :in_journey
 MAX_BALANCE = 90

 def initialize(balance = 0)
   @balance = balance
   @max_balance = MAX_BALANCE
 end

 def top_up(top_up_value)
   raise "Maximum balance of 90 exceeded" if top_up_value + @balance > @max_balance
   @balance += top_up_value
 end

 def deduct(top_up_value)
   @balance -= top_up_value
 end

 def touch_in
   @in_journey = true
 end

 def touch_out
   @in_journey = false
 end

 def in_journey?
   true
 end
end
