require 'garage'

describe Garage do

  it { is_expected.to respond_to(:broken_bikes) }
  it { is_expected.to respond_to(:fix_broken_bikes) }
  it { is_expected.to respond_to(:collect_broken_bikes_from).with(1).argument }

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


  describe '#collect_broken_bikes_from' do
    let(:broken_bikes_array) {[]}
    let(:bikes_pushed) {[]}
    let(:docking_station) { double(:docking_station, broken_bikes: broken_bikes_array) }
    let(:bike) { double(:bike, broken?: true) }
    before(:example) do
      5.times { broken_bikes_array << bike; bikes_pushed << bike}
      subject.collect_broken_bikes_from(docking_station)
    end
    it "sends @brokens_bikes array to collecter.broken_bikes" do
      expect(subject.broken_bikes).to eq bikes_pushed
    end
    it "removes bikes from @broken_bikes array after transfer to collecter" do
      expect(docking_station.broken_bikes).to be_empty
    end

  end

end
