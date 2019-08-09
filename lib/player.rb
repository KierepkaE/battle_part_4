class Player

  attr_reader :name, :HP

  def initialize(name)
    @name = name
    @HP = 100
    @hitpoint = 10
  end

  def get_hit
    @HP -= @hitpoint
  end
end