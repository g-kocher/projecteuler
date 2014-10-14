describe 'sum_of_primes' do
  it 'gives the sum of the primes below 10' do
    expect(sum_of_primes 10).to eq(17)
  end
  it 'gives the sum of the primes below 2million' do
    expect(sum_of_primes 2000000).to eq(142913828922)
  end
end

require "prime"

def sum_of_primes n
  Prime.each(n).map.reduce(:+)
end