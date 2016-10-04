require 'oystercard'

describe Oystercard do

 before(:each) do
  @oystercard = Oystercard.new
 end

 it 'has a starting balance of 0' do
   expect(@oystercard.balance).to eq(0)
 end

 context '#top_up' do
   it { is_expected.to respond_to(:top_up).with(1).argument }

   it 'can top up the balance' do
     expect{ @oystercard.top_up(0) }.to change{ @oystercard.balance }.by 0
   end

   it 'enforces maximum balance' do
     @oystercard.top_up(Oystercard::MAX_BALANCE)
     expect{ @oystercard.top_up(100) }.to raise_error "Maximum balance of 90 exceeded"
   end
 end

  context '#touch_in' do
    it 'is currently in journey' do
      @oystercard.top_up(2)
      @oystercard.touch_in
      #@oystercard.deduct(Oystercard::MIN_FARE)
      expect(@oystercard).to be_in_journey
    end
    it 'enforces minimum fare of 2' do
      expect{ @oystercard.touch_in }.to raise_error "Insufficient balance"
  end
end

  context '#touch_out' do
    it 'is not currently in journey' do
      @oystercard.top_up(2)
      @oystercard.touch_in
      @oystercard.touch_out
      expect(@oystercard).to be_in_journey
    end
    it "checks for minimum balance on oystercard" do
      @oystercard.top_up(2)
      expect { @oystercard.touch_out }.to change{ @oystercard.balance }.by (-Oystercard::MIN_FARE)
    end
  end
 end
