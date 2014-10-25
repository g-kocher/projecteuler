def number_letter_count range
  words = []
  names = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  tens = %w(0 0 twenty thirty forty fifty sixty seventy eighty ninety)
  (range).each do |i|
    hundreds = (i/100%10)
    tens_place = (i/10%10)
    ones = (i%10)

    words << names[(i/1000)] + 'thousand' if i/1000 > 0
    if hundreds > 0
      words << names[(i/100)] + 'hundred'
      words << 'and' if (tens_place > 0) || (ones > 0)
    end
    if tens_place == 1
      words << teens[i%10]
    elsif tens_place > 1
      words << tens[i/10%10] + names[i%10]
    elsif tens_place == 0
      words << names[i%10]
    end
  end
  words.join.length
end

describe 'number_letter_count' do
  it 'counts the letters in (1..5)' do
    expect(number_letter_count 1..5).to eq 19
  end
  it 'counts the letters in (1..1000)' do
    expect(number_letter_count 1..1000).to eq 21124
  end
end

