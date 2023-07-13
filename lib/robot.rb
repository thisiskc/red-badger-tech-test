class Robot
    def initialize(position, direction)
      @position_x = position[0]
      @position_y = position[1]
      @direction = direction
      @lost = false
    end
end