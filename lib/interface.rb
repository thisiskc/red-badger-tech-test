require_relative 'robot'
require_relative 'grid'

def send_instructions(input)
  output = []
  parsed_input = input.split(/\n+/)
  grid_size = [parsed_input[0][0].to_i, parsed_input[0][2].to_i]

  parsed_instructions = parsed_input[1..].partition.each_with_index { |_el, i| i.even? }
end
