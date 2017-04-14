class Garage

  attr_accessor :broken_bikes, :working_bikes

  def initialize
    @broken_bikes = []
    @working_bikes = []
  end

  def collect_broken_bikes_from(sender)
    until sender.broken_bikes.empty? do
      broken_bikes << sender.broken_bikes.pop
    end
  end

  def fix_broken_bikes
    self.working_bikes = broken_bikes
    self.broken_bikes = []
    self.working_bikes = self.working_bikes.each{|bike| bike.broken = false}
  end

end
