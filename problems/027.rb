require 'prime'

def quadratic_primes a, b
  quad_prime = []
  (-a..a).each do |a|
    Prime.each(b) do |b|
      (0..1000).each do |n|
        trial = n**2 + a*n + b
        if trial.prime?
          next
        else
          quad_prime << [a,b,n-1] if n > 1
          break
        end
      end
    end
  end
  quad_prime
end

def largest_quad_prime_series a, b
  quad_prime_series = quadratic_primes a, b
  quad_prime_series.sort{|i,j| j[2]<=>i[2] }.first
end


describe "quadratic_primes" do
  it 'gives an array of [a,b,n] for a,b<=10' do
    expect(quadratic_primes 1,41).to eq [[-1, 2, 1], [-1, 3, 2], [-1, 5, 4], [-1, 7, 1], [-1, 11, 10], [-1, 13, 1], [-1, 17, 16], [-1, 19, 1], [-1, 23, 1], [-1, 29, 2], [-1, 31, 1], [-1, 37, 1], [-1, 41, 40], [0, 2, 1], [1, 3, 1], [1, 5, 3], [1, 11, 9], [1, 17, 15], [1, 29, 1], [1, 41, 39]]
  end
end
describe 'largest_quad_prime_series' do
  before(:all) do
    @arr = largest_quad_prime_series 1000,1000
  end

  it 'gives the largest quad prime series for |a|,|b|=1000' do
    expect(@arr).to eq [-61, 971, 70] 
  end
  it 'gives the product of a and b = 1000' do
    prod = @arr[0]*@arr[1]
    expect(prod).to eq -59231
  end
end