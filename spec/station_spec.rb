require 'station'

describe Station do

  describe '#initialize' do

  it 'returns the name of the station' do
    station = Station.new('green', 1)
    expect(station.name).to eq 'green'
    end
  it 'returns the zone of the station' do
    station = Station.new('green', 1)
    expect(station.zone).to eq 1
    end
  end
end
