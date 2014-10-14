def palindrome? x
  if x.is_a?(Integer)
    y = x.to_s.reverse.to_i
  else
    y = x.reverse
  end

  if x == y
    return true
  else
    return false
  end
end

def largest_palindrome_in_range range
  a = range.to_a.reverse
  palindrome = []
  a.each do |i|
    a.each do |j|
      k = i * j
      palindrome << k if palindrome? k
    end
  end
  palindrome.max
end

describe 'largest_palindrome_in_range' do
  it 'returns the largest product palindrome in 1..11' do
    expect(largest_palindrome_in_range 1..11).to eq(121)
  end
  it 'returns the largest product palindrome in 100..999' do
    expect(largest_palindrome_in_range 100..999).to eq(906609)
  end
end

describe 'palindrome' do
  it 'returns false for "word"' do
    expect(palindrome? 'word').to eq(false)
  end
  it 'returns true for "dad"' do
    expect(palindrome? 'dad').to eq(true)
  end
  it 'returns false for 12' do
    expect(palindrome? 12).to eq(false)
  end
  it 'returns true for 11' do
    expect(palindrome? 11).to eq(true)
  end
end