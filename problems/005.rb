require 'prime'

def smallest_multiple range
  primes = range.to_a.map{|i| prime_factors i}
  puts primes
  h = Hash.new(0)
  primes.each do |i|
    i.each_key {|k| h[k] = [h[k], i[k]].max }
  end
  puts h
  r = h.map{|k,v| k**v}.reduce(:*)
  puts r
  r
end

def prime_factors n
  n.prime_division.to_h
end

describe "prime_factors" do
  it 'gives the prime factors of 10' do
    expect(prime_factors 10).to eq({2 => 1, 5 => 1})
  end
  it 'gives the prime factors of 100' do
    expect(prime_factors 100).to eq({2 => 2, 5 => 2})
  end
end

describe 'smallest_multiple' do
  it 'gives smallest multiple for all numbers in 1..3' do
    expect(smallest_multiple 1..3).to eq(6)
  end
  it 'gives the smallest multiple for all numbers in 1..10' do
    expect(smallest_multiple 1..10).to eq(2520)
  end
  it 'gives the smallest multiple for all numbers in 1..20' do
    expect(smallest_multiple 1..20).to eq(232792560)
  end
end
