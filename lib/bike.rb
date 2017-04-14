class Bike

  attr_accessor :broken

  def initialize
    @broken = false
  end

  def broken?
    self.broken ? true : false
  end

  def report_broken
    self.broken = true
  end
  
  def repair
    self.broken = false
  end

end
