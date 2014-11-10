def champerowne size
  top = 
  1.upto(size).to_a.join
end

def nth_d string, position
  string[position-1].to_i
end

def solution
  array = [1,10,100,1000,10000,100000,1000000]
  champ = champerowne(array.max)
  array.map{|i| nth_d(champ, i)}.reduce(:*)
end

describe 'champerowne' do
  it 'gives the first 10 of the constant' do
    expect(champerowne(4)).to eq '1234'
  end
end

describe 'nth_d' do 
  it 'gives the n-th digit of a series' do
    expect(nth_d [1,2,3,4,5], 3).to eq 3
  end
end

describe 'solution' do
  it 'gives the answer to #40' do 
    expect(solution).to eq 210
  end
end
