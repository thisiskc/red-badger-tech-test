require_relative 'robot'
require_relative 'grid'

def send_instructions(input)
  output = []
  parsed_input = input.split(/\n+/)
  grid_size = [parsed_input[0][0].to_i, parsed_input[0][2].to_i]

  parsed_instructions = parsed_input[1..].partition.each_with_index { |_el, i| i.even? }

  starting_positions = parsed_instructions[0]
  movement_instructions = parsed_instructions[1]

  grid = Grid.new(grid_size[0], grid_size[1])

  starting_positions.each_with_index do |position, i|
    starting_command = position.gsub(' ', '').split('')
    instructions = movement_instructions[i]
    starting_pos = [starting_command[0].to_i, starting_command[1].to_i]
    direction = starting_command[2]
  end
end
