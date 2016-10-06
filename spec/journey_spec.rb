require 'journey'

describe Journey do

subject(:journey) { described_class.new }
let(:station) { double(:angel_station)}

describe '#start' do
  it 'sets an entry station' do
    journey.start(station)
    expect(journey.start_station).to eq station
  end
end

  describe '#end' do
    it "ends a journey" do
      journey.end(station)
      expect(journey.end_station).to eq station
    end
  end

describe '#calculate fare' do
  it 'charges a minimum fare if journey is completed' do
      journey.start(station)
      journey.end(station)
      expect(journey.calculate_fare).to eq Journey::MIN_FARE
    end

  it 'charges a penalty fare if journey does not have a start' do
    journey.end(station)
    expect(journey.calculate_fare).to eq Journey::PEN_FARE
    end

  it 'charges a penalty fare if journey does not have an end' do
    journey.start(station)
    expect(journey.calculate_fare).to eq Journey::PEN_FARE
    end
  end
end
