require 'journey'

describe Journey do

  subject(:journey) { described_class.new(start_station) }

  let(:start_station) {double :start_station}
  let(:end_station) {double :end_station}

  it 'initializes with a start station' do
    expect(subject.journey).to eq [start_station]
  end

  describe '#end' do
    it "ends a journey" do
      journey.end(end_station)
      expect(journey.journey[1]).to eq end_station
    end
  end




end
