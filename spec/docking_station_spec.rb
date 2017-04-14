require './lib/docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it {is_expected.to respond_to :capacity}

  it "can store a @capacity value at initialisation" do
    station = DockingStation.new(25)
    expect(station.capacity).to eq 25
  end

  it "stores DEFAULT_CAPACITY as @capacity if no argument is passed at initialization" do
    station = DockingStation.new()
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    let(:bike) { double :bike }
    it 'returns a docked bike' do
      allow(bike).to receive(:broken).and_return(false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an exception when user tries to release a bike from an empty docking station' do
      expect{ subject.release_bike}.to raise_error 'Error: no bikes available at this docking station.'
    end
    it 'doesn\'t return broken bikes' do
      #bike = Bike.new; 
      allow(bike).to receive(:broken).and_return(true)
      subject.dock(bike)
      expect{ subject.release_bike }.to raise_error 'Error: no bikes available at this docking station.'
    end
  end

  describe '#dock' do
    let(:bike) { double :bike }
    let(:station) { DockingStation.new(35) }
    before(:example) do
      allow(bike).to receive(:broken).and_return(true)
    end
    it 'adds a bike to the docking_station\'s @bikes array' do
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end
    it 'raises an exception when a user tries to dock a bike at a full docking station' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike)}.to raise_error 'Error: this docking station is occupied.'
    end
    it "allows a different number of bikes to be docked when a custom @capacity has been set for the DockingStation" do
      35.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error 'Error: this docking station is occupied.'
    end
  end



end
