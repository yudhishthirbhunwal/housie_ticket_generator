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

    it "has exactly 5 positive numbers in each row" do
      ticket = Housie.generate_ticket
      ticket.each do |row|
        expect(row.reject(&:zero?).count).to eq(5)
      end
    end

    it "has no zero column" do
      ticket = Housie.generate_ticket
      (0..8).each do |col_idx|
        count = 0
        (0..2).each do |row_idx|
          count += 1 if ticket[row_idx][col_idx].zero?
        end
        expect(count).not_to eq(3)
      end
    end

    it "has unique values only" do
      ticket = Housie.generate_ticket
      non_zero_array = ticket.flatten.reject(&:zero?)
      positive_value_count = non_zero_array.count
      unique_positive_value_count = non_zero_array.uniq.count
      expect(unique_positive_value_count).to eq(positive_value_count)
    end
  end
end
