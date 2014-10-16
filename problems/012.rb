require 'prime'

def first_triangle_with_n_divisors n
  d = 0
  x = 1
  triangle = 1

  while d < n
    x += 1
    triangle += x
    a = Prime.prime_division(triangle)
    d = a.map{|i| i.last + 1}.flatten.reduce(:*)
  end
  [x, triangle]
end

describe 'first_triangle_with_n_divisors' do
  it 'gives the first triangle with 2 divisors' do
    expect(first_triangle_with_n_divisors 2).to eq [2, 3]
  end

  it 'gives the first triangle with 4 divisors' do
    expect(first_triangle_with_n_divisors 4).to eq [3, 6]
  end
  it 'gives the first triangle with 5 divisors' do
    expect(first_triangle_with_n_divisors 5).to eq [7, 28]
  end
  it 'gives the first triangle with 500 divisors' do
    expect(first_triangle_with_n_divisors 500).to eq [12375, 76576500]
  end
end