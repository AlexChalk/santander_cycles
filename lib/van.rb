class Van

  attr_accessor :broken_bikes
  
  def initialize
    @broken_bikes = []
  end

  def collect_broken_bikes_from(sender)
    until sender.broken_bikes.empty? do
      broken_bikes << sender.broken_bikes.pop
    end
  end

end
