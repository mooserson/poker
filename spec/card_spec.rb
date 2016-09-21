require 'rspec'


describe Card do
  subject(:card) { Card.new(12, :hearts) }

  describe "#initialize" do

    it "initializes each card with a value and a suit" do
      expect(card.value).to eq(12)
      expect(card.suit).to eq(:hearts)
    end
  end
end
