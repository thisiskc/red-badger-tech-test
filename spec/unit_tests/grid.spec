require 'grid'

describe Grid do
  describe '#valid_move?' do
    before(:each) do
      @grid = Grid.new(5, 3, [[3, 3, 'N']])
    end

    it "returns true when given coordinates that don't intersect with existing lost positions" do
      expect(@grid.valid_move?([6, 2], 'N')).to eq true
    end

    it 'returns false when given coordinates intersect with existing lost positions' do
      expect(@grid.valid_move?([3, 5], 'N')).to eq false
    end

    it 'returns true when given coordinates intersect with existing lost positions, but not direction' do
      expect(@grid.valid_move?([3, 5], 'E')).to eq true
    end

    it 'adds final edge position to @lost_robot_coordinates' do
      new_grid = Grid.new(5, 3, [[3, 4, 'W']])
      new_grid.valid_move?([6, 2], 'W')
      expect(new_grid.all_lost_coordinates).to eq [[3, 4, 'W'], [5, 2, 'W']]
    end
  end

  describe '#lost_move?' do
    before(:each) do
      @grid = Grid.new(5, 3, [[5, 3, 'N']])
    end

    it 'returns true when a position is off-grid' do
      expect(@grid.lost_move?([5, 4], 'N')).to eq true
    end

    it 'returns false when a position is not off-grid' do
      expect(@grid.lost_move?([5, 2], 'N')).to eq false
    end
  end
end
