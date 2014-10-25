require 'prime'
def circular_primes max
  circ_prime  = []

  Prime.each(max) do |prime|
    str = prime.to_s.split('')
    count = 0
    (1..(str.count)).map do |j|
      str.rotate(j).join.to_i.prime? ? count +=1 : break
      count == str.count ? circ_prime << prime : nil
    end
  end
  circ_prime
end

describe 'circular_primes' do
  it 'gives all circular primes below 100' do
    expect(circular_primes 100).to eq [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]
  end
  it 'gives the number of circular primes under 1M' do
    less_than_1_million = circular_primes(1000000)
    expect(less_than_1_million.count).to eq 55
  end
end
