require 'game'

describe Game do
  subject(:game) {described_class.new(player1,player2)}
  let(:player1) {double(:player1)}
  let(:player2) {double(:player2)}


  describe "#attack" do
    it "substract hit point from the victim" do
      expect(player1).to receive(:get_hit)
      subject.attack(player1)
    end
  end

end