class Grid
  def initialize(max_x, max_y, lost_robot_coordinates = [])
    @max_x = max_x
    @max_y = max_y
    @lost_robot_coordinates = lost_robot_coordinates
  end
  
  def all_lost_coordinates
    @lost_robot_coordinates
  end

  def valid_move?(position, direction)
    potential_edge_position = [get_new_coord(position[0], @max_x), get_new_coord(position[1], @max_y), direction]
    can_sense_edge_move = @lost_robot_coordinates.include?(potential_edge_position)

    if position != [potential_edge_position[0],
                    potential_edge_position[1]] && !can_sense_edge_move && !@lost_robot_coordinates.include?(potential_edge_position)
      @lost_robot_coordinates << potential_edge_position
    end

    !can_sense_edge_move
  end


  private

  def get_new_coord(position, max_position)
    if position > max_position
      return max_position
    elsif position.negative?
      return 0
    end

    position
  end
end
  