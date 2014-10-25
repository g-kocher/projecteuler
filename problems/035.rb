require 'prime'
def circular_primes max
  circ_prime  = []
  Prime.each(max) do |prime|
    str = prime.to_s.split('')
    circular = str.count == 1 ? true : (1..(str.count - 1)).map do |j|
      str.rotate(j).join.to_i.prime?
    end.reduce(:&)
    circ_prime << prime if circular
  end
  circ_prime
end

describe 'circular_primes' do
  it 'gives all circular primes below 100' do
    expect(circular_primes 100).to eq [2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97]
  end
  it 'gives the number of circular primes under 1M' do
    less_than_1_million = circular_primes(1000000)
    expect(less_than_1_million.count).to eq 0
  end
end
