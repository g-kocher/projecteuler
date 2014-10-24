def longest_collatz_under n
  sequence_counts = {}
  
  def collatz n
    counter = 1
    while n != 1
      if n.even?
        counter += 1
        n /= 2
      else
        counter += 1
        n = 3*n+1
      end
    end
    counter
  end

  (1..n).each do |n|
    sequence_counts[n] = collatz(n)
  end

  sequence_counts.max_by{|k,v|v}.first
end

describe 'longest_collatz_under' do
  it 'returns the longest collatz sequence under 10' do
    expect(longest_collatz_under 5).to eq 3
  end
  it 'gives the longest starting sequence under 1M' do
    expect(longest_collatz_under 1000000).to eq 837799
  end
end