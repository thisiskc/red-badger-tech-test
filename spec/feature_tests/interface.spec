require 'interface'

describe Interface do
  describe '#send_instructions' do
    before(:all) do
    input = "5 3\n1 1 E\nRFRFRFRF\n3 2 N FRRFLLFFRRFLL\n0 3 W LLFFFLFLFL"
      @result = send_instructions(input)
    end

    it "returns true when given coordinates that don't intersect with existing lost positions" do
      expect(@result).to eq "1 1 E\n3 3 N LOST\n2 3 S"
    end
  end
end
