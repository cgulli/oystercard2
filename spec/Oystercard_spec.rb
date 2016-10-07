require 'oyster_card'
require 'journey'

describe OysterCard do
subject(:oyster_card) { described_class.new }
subject(:topped_up_card) {described_class.new(10)}

let(:station) {double :station}
let(:journey) {double :journey}

	describe 'initializing a card' do
		it 'initializes a zero balance by default' do
			expect(oyster_card.balance).to eq 0
		end

		# it 'initializes a not in journey' do
		# 	expect(oyster_card.in_journey?).to eq false
		# end

		it 'initializes with an empty journey history' do
			expect(oyster_card.journey_history).to eq([])
		end

	end

	describe '#top_up' do

		it 'card responds to top_up' do
			expect(oyster_card).to respond_to(:top_up).with(1).argument
		end

		it 'Adds money to the card' do
			oyster_card.top_up(10)
			expect(oyster_card.balance).to eq 10
		end

		it 'Sets a maxium of 90' do
			expect{oyster_card.top_up(95)}.to raise_error "Card limit reached(£#{OysterCard::MAX_VALUE})"
		end
	end

 	describe '#touch_in' do
		# it 'changes card to be on a journey when touched in' do
		# 	topped_up_card.touch_in(station)
		# 	expect(topped_up_card.current_journey.journey).to be_in_journey
		# end

		it 'doesn\'t allow card to be touched in with insufficient funds - min £1' do
			expect{oyster_card.touch_in(station)}.to raise_error "Insufficient funds, please top up"
		end

		# it 'sets an entry station on touch in' do
		# 	topped_up_card.touch_in(station)
		# 	expect(topped_up_card.current_journey.journey[0]).to eq station
		# end
	end

	describe '#touch_out' do
		let(:start_station) {double :start_station}
		let(:end_station) {double :end_station}

		before do
			topped_up_card.touch_in(start_station)
		end

		it 'take an aurgument of a station' do
			expect(topped_up_card).to respond_to(:touch_out).with(1).argument
		end

		#  it 'changes card to be not on a journey when touched out' do
		#  	topped_up_card.touch_out(exit_station)
		#  	expect(topped_up_card).not_to be_in_journey
		#  end


		it 'deducts money from the card when touched out' do
			topped_up_card.touch_in(start_station)
			expect{topped_up_card.touch_out(end_station)}.to change{topped_up_card.balance}.by(-6)
		end

		it 'adds an end station to the journey' do
			topped_up_card.touch_out(end_station)
			expect(topped_up_card.current_journey.journey_history[1]).to eq end_station
		end

		it 'logs the completed journey to the journey history after touching out' do
			topped_up_card.touch_out(end_station)
			expect(topped_up_card.journey_history[0].journey).to eq([start_station, end_station])
		end
	end
end
