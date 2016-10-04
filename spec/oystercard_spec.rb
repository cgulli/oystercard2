require 'oystercard'

describe Oystercard do
 oystercard = Oystercard.new

 it 'has a starting balance of 0' do
   expect(oystercard.balance).to eq(0)
 end

 describe '#top_up' do
   it { is_expected.to respond_to(:top_up).with(1).argument }

   it 'can top up the balance' do
     top_up_value = 5
     expect{ oystercard.top_up(top_up_value) }.to change{ oystercard.balance }.by top_up_value
   end

   it 'enforces maximum balance' do
     oystercard.top_up(Oystercard::MAX_BALANCE)
     expect{ oystercard.top_up(100) }.to raise_error 'Maximum balance of 90 exceded'
   end
 end
end
