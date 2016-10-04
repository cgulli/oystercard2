require 'oystercard'

describe Oystercard do
 oystercard = Oystercard.new

 it 'has a starting balance of 0' do
   expect(oystercard.balance).to eq(0)
 end

 describe '#top_up' do
   it { is_expected.to respond_to(:top_up).with(1).argument }

   it 'can top up the balance' do
     expect{ oystercard.top_up(0) }.to change{ oystercard.balance }.by 0
   end

   it 'enforces maximum balance' do
     oystercard.top_up(Oystercard::MAX_BALANCE)
     expect{ oystercard.top_up(100) }.to raise_error "Maximum balance of 90 exceeded"
   end
 end

 describe '#deduct'do
   it { is_expected.to respond_to(:deduct).with(1).argument}

   it 'reduces balance by one fare amount' do
    expect{ oystercard.deduct(2) }.to change{ oystercard.balance }.by (-2)
   end
  end

  describe '#touch_in' do
    it 'is currently in journey' do
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'is not currently in journey' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).to be_in_journey
    end
  end
 end
