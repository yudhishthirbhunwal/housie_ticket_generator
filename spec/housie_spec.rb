require "housie"

RSpec.describe Housie do
  describe ".generate_ticket" do
    it "generates a 3X9 2D array" do
      ticket = Housie.generate_ticket
      expect(ticket.class).to eq(Array)
      expect(ticket.length).to eq(3)
      ticket.each do |row|
        expect(row.length).to eq(9)
      end
    end

    ticket = Housie.generate_ticket
    it "has exactly 5 positive numbers in each row" do
      ticket.each do |row|
        expect(row.reject(&:zero?).count).to eq(5)
      end
    end
    # it "show array" do
    #   # ticket = Housie.generate_ticket
    #   expect(ticket).to eq(Array)
    # end
  end
end
