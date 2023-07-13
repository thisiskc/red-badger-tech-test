require 'robot'

describe Robot do
  let(:grid) { double :grid }

  describe '#move when moves are valid' do
    before(:each) do
      @robot = Robot.new([0, 3], 'W')
      @result = @robot.move('LLFFFLLFL', grid)
    end

    it "it returns the robot's final position and direction" do
      expect(@result).to eq '2 3 S'
    end
  end

  describe '#move when moves are invalid' do
    before(:each) do
      @robot = Robot.new([3, 2], 'N')
      @result = @robot.move('FRRFLLFFRRFLL', grid)
    end

    it "it returns the robot's final position, direction, and LOST" do
      expect(@result).to eq '3 3 N LOST'
    end
  end
end
