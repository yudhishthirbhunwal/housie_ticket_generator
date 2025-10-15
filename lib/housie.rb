class Housie
  def self.generate_ticket
    ticket = Array.new(3) { Array.new(9, 0) }

    data_lookup = {
      1..9 => (1..9).to_a.sample(3).sort,
      10..19 => (10..19).to_a.sample(3).sort,
      20..29 => (20..29).to_a.sample(3).sort,
      30..39 => (30..39).to_a.sample(3).sort,
      40..49 => (40..49).to_a.sample(3).sort,
      50..59 => (50..59).to_a.sample(3).sort,
      60..69 => (60..69).to_a.sample(3).sort,
      70..79 => (70..79).to_a.sample(3).sort,
      80..90 => (80..90).to_a.sample(3).sort,
   }

    (0..2).each do |row_idx|
      (0..8).to_a.sample(5).each do |col_idx|
        # edge cases for generating ranges
        optional_add_1 = (col_idx == 0) ? 1 : 0
        optional_add_2 = (col_idx == 8) ? 1 : 0
        # getting the range for the particular column
        range = (col_idx*10+optional_add_1)..(col_idx*10+9+optional_add_2)
        # assigning value from lookup
        ticket[row_idx][col_idx] = data_lookup[range][row_idx]
      end
    end

    empty_cols_idx = []
    two_cols_idx = []
    full_cols_idx = []
    (0..8).each do |col_idx|
      count = 0
      (0..2).each do |row_idx|
        count += 1 if ticket[row_idx][col_idx].positive?
      end
      empty_cols_idx << col_idx if count.zero?
      two_cols_idx << col_idx if count == 2
      full_cols_idx << col_idx if count == 3
    end

    if !empty_cols_idx.empty?
      empty_cols_idx.each_with_index do |empty_idx, index|
        random_idx = (0..2).to_a.sample
        # edge cases for generating ranges
        optional_add_1 = (empty_idx == 0) ? 1 : 0
        optional_add_2 = (empty_idx == 8) ? 1 : 0
        # getting the range for the particular column
        range = (empty_idx*10+optional_add_1)..(empty_idx*10+9+optional_add_2)

        ticket[random_idx][empty_idx] = data_lookup[range][random_idx]
        col = full_cols_idx[index]
        if col.nil?
          two_cols_idx.each do |i|
            if ticket[random_idx][two_cols_idx[i]] == 0
              next
            else
              ticket[random_idx][two_cols_idx[i]] = 0
              break
            end
          end
        else
          ticket[random_idx][col] = 0
        end
      end
    end

    ticket
  end
end
