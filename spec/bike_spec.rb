require './lib/bike.rb'

describe Bike do
  it { is_expected.to respond_to(:working?) }
  it { is_expected.to respond_to(:report_broken) }

  describe '#broken' do
    it "Returns false by default" do
      expect(subject.broken).to eq false
    end
    it "returns true if #report_broken has been called on a Bike" do
      subject.report_broken
      expect(subject.broken).to eq true
    end
  end
end
