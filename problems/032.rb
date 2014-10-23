def pandigital? number, n= 9
  numbers = number.to_s.split(//).map{|i| i.to_i }.sort.join
  if numbers == (1..n).to_a.join
    true
  else
    false
  end
end

def pandigital_products
  pandigital_prods = []
  (2..9).each do |i|
    (1234..9876).each do |j|
      product = i*j
      if pandigital? i.to_s + j.to_s + product.to_s
        pandigital_prods << [i,j,product].sort
      end
    end
  end
  (12..98).each do |i|
    (123..987).each do |j|
      product = i*j
      if pandigital? i.to_s + j.to_s + product.to_s
        pandigital_prods << [i,j,product].sort
      end
    end
  end
  pandigital_prods.map{|i| i.last}.uniq.inject(:+)
end

describe 'pandigital?' do
  it 'says 123456789 is pandigital' do
    expect(pandigital? 123456789).to be true 
  end
  it 'says 124 is not pandigital' do
    expect(pandigital? 1234556789).to be false
  end
end

describe 'pandigital_products' do
  it 'gives the sum of the pandigital products 1..9' do
    expect(pandigital_products).to eq 45228
  end
end