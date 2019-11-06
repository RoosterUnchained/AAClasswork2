class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = Array.new() { Array.new(0) }
    @towers[0] = Array.new(3, 0)
    @towers[1] = Array.new(0, 0)
    @towers[2] = Array.new(0, 0)
    @towers[0] = [3, 2, 1]
  end

  def move(from_tower, to_tower)
    disk = from_tower.last
    to_tower.push(disk)
  end
end
