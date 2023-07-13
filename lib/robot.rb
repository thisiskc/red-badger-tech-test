class Robot
    def initialize(position, direction)
      @position_x = position[0]
      @position_y = position[1]
      @direction = direction
      @lost = false
    end

    def move(instructions, grid)
        instructions.each_char do |char|
          next if @lost
    
          case char
          when 'F'
            move_forward(grid)
          when 'R'
            turn_right
          when 'L'
            turn_left
          end
        end

        get_final_position
      end
    end

end

