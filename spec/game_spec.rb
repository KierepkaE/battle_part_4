require 'game'

describe Game do

  let(:victim) {double(:victim)}
  subject(:game) {described_class.new(victim,victim)}

  describe "#attack" do
    it "substrat hit point from the victim" do
      expect(victim).to receive(:get_hit)
      subject.attack(victim)
    end
  end

end