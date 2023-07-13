class Grid
  def initialize(max_x, max_y, lost_robot_coordinates = [])
    @max_x = max_x
    @max_y = max_y
    @lost_robot_coordinates = lost_robot_coordinates

    if max_x > 50
      @max_x = 50
    end

    if max_y > 50
      @max_y = 50
    end
  end
  
  def all_lost_coordinates
    @lost_robot_coordinates
  end

  def valid_move?(position, direction)
    potential_edge_position = get_edge_coordinates(position[0], position[1]) << direction
    can_sense_edge_move = @lost_robot_coordinates.include?(potential_edge_position)

    if position != potential_edge_position[0..1] && !can_sense_edge_move
      @lost_robot_coordinates << potential_edge_position
    end

    !can_sense_edge_move
  end

  def lost_move?(position, direction)
    potential_edge_position = get_edge_coordinates(position[0], position[1]) << direction
    is_off_edge = potential_edge_position != position
    @lost_robot_coordinates.include?(potential_edge_position) && is_off_edge
  end

  def get_edge_coordinates(pos_x, pos_y)
    [get_new_coord(pos_x, @max_x), get_new_coord(pos_y, @max_y)]
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
  