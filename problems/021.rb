require 'prime'

def factors_of n
  primes, powers = n.prime_division.transpose
  exponents = powers.map{|i| (0..i).to_a}
  divisors = exponents.shift.product(*exponents).map do |powers|
    primes.zip(powers).map{|prime, power| prime ** power}.inject(:*)
  end
  divisors.sort.map{|div| div}
end

def amiciable? n
  unless n.prime?
    a = factors_of(n)[0..-2].inject(:+)
    a.prime? ? b = 0 : b = factors_of(a)[0..-2].inject(:+)
    n == b && a != n ? [b, a] : []
  else 
    []
  end
end

def a_a max
  amiciable = []
  2.upto max do |i|
    amiciable?(i).each{|a| amiciable << a}
  end
  amiciable.uniq.inject(:+)
end

describe 'factors_of' do
  it 'gives the factors of 6' do
    expect(factors_of 6).to eq [1,2,3,6]
  end
  it 'gives the factors of 28' do
    expect(factors_of 28).to eq [1,2,4,7,14,28]
  end
end

describe 'amiciable?' do
  it 'gives 220 and 284 as amiciable' do
    expect(amiciable? 220).to eq [220,284]
  end
end

describe 'amiciable_array' do
  it 'gives an array of amiciable numbers less than 10000' do
    expect(a_a 10000).to eq 31626
  end
end
