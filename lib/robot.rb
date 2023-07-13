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

    private

    def turn_right
        case @direction
        when 'N'
          @direction = 'E'
        when 'E'
          @direction = 'S'
        when 'S'
          @direction = 'W'
        when 'W'
          @direction = 'N'
        end
    end
    
    def turn_left
        case @direction
        when 'N'
            @direction = 'W'
        when 'W'
            @direction = 'S'
        when 'S'
            @direction = 'E'
        when 'E'
            @direction = 'N'
        end
    end

    def move_forward(grid)
      new_x = @position_x
      new_y = @position_y
  
      case @direction
      when 'N'
        new_y += 1
      when 'S'
        new_y -= 1
      when 'E'
        new_x += 1
      when 'W'
        new_x -= 1
      end

      check_valid_position(grid, [new_x, new_y])
    end

    def check_valid_position(grid, new_position)
      if grid.valid_move?(new_position, @direction)
          @position_x = new_position[0]
          @position_y = new_position[1]
          @lost = grid.lost_move?(new_position, @direction)
      end
  
      if @lost
          last_valid_position = grid.get_edge_coordinates(@position_x, @position_y)
          @position_x = last_valid_position[0]
          @position_y = last_valid_position[1]
      end
    end
end

