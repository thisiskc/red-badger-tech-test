# Red Badger tech test

## Specification

* Given an input with: `grid_size`, `robot_starting_position`, and `actions`, return each robot's ending coordinates
* Maximum value for any coordinate is `50`
* Lower left corner is `0,0`
* Current accepted actions: 
    ```
    F => move forward 1 coordinate
    L => turn 90 degrees to the left
    R => turn 90 degrees to the right
    ```
* Directions the robot can face:
    ```
    N => North (facing up (x, y+1))
    S => South
    E => East
    W => West
    ```
* Input is a single string with newlines, in the following format - with lines 2 & 3 repeating for each robot:
    ```
    1st line => grid size, separated by whitespace
    2nd line => starting coordinate of robot and their orientation, separated by whitespace
    3rd line => all actions for the robot, not separated
    ```
* If a robot goes off the map, they must return their final coordinate and orientation + `LOST`
* If a robot goes off the map, they leave a "warning" at their last grid location
* If another robot is asked to move off the grid over a coordinate with a "warning", they will ignore that instruction

### Input

```
5 3
1 1 E 
RFRFRFRF
3 2 N 
FRRFLLFFRRFLL
0 3 W 
LLFFFLFLFL
```

### Output
```
1 1 E
3 3 N LOST 
2 3 S
```

## How to use

### Set up

1. Load up `IRB` or a REPL of your choice
2. Require the interface.rb file:
   If using PRY: `load './lib/interface.rb'`
   If using IRB: `require './lib/interface.rb'`

### Command

- To send your instructions: `send_instructions(input)`

For example, if you would like to run the sample data: `send_instructions("5 3\n1 1 E\nRFRFRFRF\n3 2 N\nFRRFLLFFRRFLL\n0 3 W \nLLFFFLFLFL")`
