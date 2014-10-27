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

def double_base_palindromes max
  (1..max).map do |i|
    if palindrome?(i) && palindrome?(i.to_s(base=2))
      i
    end
  end.compact
end


describe 'double_base_palindromes' do
  before(:all) do
    @double_base = double_base_palindromes 1000000
  end
  it 'gives double base palindromes under 1000' do
    expect(double_base_palindromes 100).to eq [1, 3, 5, 7, 9, 33, 99]
  end
  it 'gives double base palindromes under 1 million' do
    expect(@double_base).to eq [1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]
  end
  it 'gives the sum of the double_base_palindromes under 1million' do
    sum = @double_base.reduce(:+)
    expect(sum).to eq 872187
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