# Housie Ticket Generator

A Ruby implementation of a Housie (Tambola/Bingo) ticket generator that creates valid tickets following standard game rules.

## Features

- Generates standard 3x9 Housie tickets
- Follows all official game rules:
  - Each row contains exactly 5 numbers and 4 blank spaces
  - Numbers are arranged in 9 columns
  - Each column contains numbers from specific ranges:
    - Column 1: 1-9
    - Column 2: 10-19
    - Column 3: 20-29
    - Column 4: 30-39
    - Column 5: 40-49
    - Column 6: 50-59
    - Column 7: 60-69
    - Column 8: 70-79
    - Column 9: 80-90
  - Every column must have at least one number
  - All numbers on a ticket are unique
  - Numbers within each column are arranged in ascending order

## Installation

```bash
# Clone the repository
git clone https://github.com/yudhishthirbhunwal/housie_ticket_generator.git

# Navigate to the project directory
cd housie_ticket_generator

# Install dependencies
bundle install
```

## Usage

```ruby
require 'housie'

# Generate a single ticket
ticket = Housie.generate_ticket

# Print the ticket (example output formatting)
ticket.each do |row|
  puts row.map { |n| n.zero? ? '  ' : n.to_s.rjust(2) }.join(' ')
end
```

Example output:
```
 3 11    31       61 71   
   12 21 35 44 52       82
 8    25 38 45    67    85
```

## Testing

The project uses RSpec for testing. Run the test suite with:

```bash
bundle exec rspec
```

The test suite verifies:
- Ticket structure (3x9 array)
- Row validation (exactly 5 numbers per row)
- Column validation (no empty columns)
- Number uniqueness
- Range constraints for each column

## Implementation Details

The generator employs a deterministic algorithm that:

1. Creates a lookup table of possible numbers for each column
2. Ensures balanced distribution of numbers across rows
3. Validates column-specific range constraints
4. Maintains uniqueness of numbers
5. Handles edge cases for first (1-9) and last (80-90) columns

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## Project Status

This is an active project. Future enhancements may include:
- Multiple ticket generation for full game sets
- Custom formatting options
- Performance optimizations for bulk generation
- Additional validation rules
