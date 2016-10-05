require_relative 'journey'

class OysterCard
	attr_reader :balance, :journey_history, :current_journey

	MAX_VALUE = 90
	MIN_VALUE = 1

	def initialize(balance = 0)
		 @balance = balance
		 @journey_history = []
	end

	def top_up(money)
		raise 'Card limit reached(£90)' if balance + money > MAX_VALUE
		@balance += money
	end

	def in_journey?
		!@current_journey.journey[:start_station].nil?
	end

	def touch_in(station)
		raise 'Insufficient funds, please top up' if balance < MIN_VALUE
		@current_journey = Journey.new(station)
	end

	def touch_out(station)
		deduct(MIN_VALUE)
		@current_journey.end(station)
		@journey_history << @current_journey
	end

	private

	def deduct(value)
		@balance -= value
	end
end
