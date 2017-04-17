require 'garage'
require './spec/support/bike_container'

describe Garage do

  it { is_expected.to respond_to(:fix_broken_bikes) }
  it_behaves_like "a bike container"

  describe '#fix_broken_bikes' do
    let(:bike) { double(:bike, broken?: false)}
    let(:bikes_pushed) {[]}
    before(:example) do
      allow(bike).to receive(:broken=)
      5.times { subject.broken_bikes << bike; bikes_pushed << bike}
      subject.fix_broken_bikes
    end
    it "transfers previously broken bikes from @broken_bikes to @working_bikes" do
      expect(subject.broken_bikes).to be_empty
      expect(subject.working_bikes).to eq bikes_pushed
    end
    it "fixes broken bikes" do
      expect(subject.working_bikes.select{|bike| bike.broken? == false}).to eq subject.working_bikes
    end
  end

end
