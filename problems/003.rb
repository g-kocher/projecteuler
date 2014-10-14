require 'Prime'
def largest_prime_factor_of n
  primes_less_than(Math.sqrt(n)+6).map{|i| i if n % i == 0}.compact.last
end

def primes_less_than x
  primes = [2,3]
  i=5
  while i < (x+1)
    t = primes.map do |j|
      i % j
    end
    primes << i unless t.index(0)
    i += 1
  end
  primes
end


describe 'primes_less_than' do
  it 'should return primes less than 6' do
    expect(primes_less_than 6).to eq([2,3,5])
  end
end

describe "largest_prime_factor_of" do
  it 'should return the largest prime of 10' do
    expect(largest_prime_factor_of 10).to eq(5)
  end
  it 'should return the largest prime of 100' do
    expect(largest_prime_factor_of 100).to eq(5)
  end
  it 'should return the largest prime of 99' do
    expect(largest_prime_factor_of 99).to eq(11)
  end

  it 'should return the largest prime of 600851475143' do
    expect(largest_prime_factor_of 600851475143).to eq(6857)
  end
end