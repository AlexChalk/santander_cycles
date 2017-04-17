require 'bike_container'

RSpec.shared_examples "a bike container" do
  let(:bike_container) { described_class.new }

  it { is_expected.to respond_to(:broken_bikes) }
  it { is_expected.to respond_to(:broken_bikes=) }
  it { is_expected.to respond_to(:working_bikes) }
  it { is_expected.to respond_to(:working_bikes=) }
  it { is_expected.to respond_to(:collect_broken_bikes_from).with(1).argument }
  it { is_expected.to respond_to(:collect_working_bikes_from).with(1).argument }

  describe '#collect_broken_bikes_from' do
    let(:broken_bikes_array) {[]}
    let(:bikes_pushed) {[]}
    let(:initial_location) { double(:initial_location, broken_bikes: broken_bikes_array) }
    let(:bike) { double(:bike, broken?: true) }
    before(:example) do
      5.times { broken_bikes_array << bike; bikes_pushed << bike}
      subject.collect_broken_bikes_from(initial_location)
    end
    it "sends @brokens_bikes array of deliverer to collecter" do
      expect(subject.broken_bikes).to eq bikes_pushed
    end
    it "removes bikes from @broken_bikes array after transfer to collecter" do
      expect(initial_location.broken_bikes).to be_empty
    end
  end

  describe '#collect_working_bikes_from' do
    let(:working_bikes_array) {[]}
    let(:bikes_pushed) {[]}
    let(:initial_location) { double(:initial_location, working_bikes: working_bikes_array) }
    let(:bike) { double(:bike, broken?: false) }
    before(:example) do
      5.times { working_bikes_array << bike; bikes_pushed << bike}
      subject.collect_working_bikes_from(initial_location)
    end
    it "sends @working_bikes array of deliverer to collecter" do
      expect(subject.working_bikes).to eq bikes_pushed
    end
    it "removes bikes from @working_bikes array after transfer to collecter" do
      expect(initial_location.working_bikes).to be_empty
    end
  end

end
  
