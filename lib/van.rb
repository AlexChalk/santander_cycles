class Van

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

  def collect_working_bikes_from(sender)
    until sender.working_bikes.empty? do
      working_bikes << sender.working_bikes.pop
    end
  end

end
