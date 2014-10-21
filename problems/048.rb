def self_power n
  n**n
end

def last_ten_digits_of n
  n.to_s.split(//).last(10).join()
end

def last_ten_of_self_power_series max
  last_ten_digits_of 1.upto(max).map{|i| self_power i}.reduce(:+) 
end


describe "self_power" do
  it 'returns the sum of 1**1 + ... + 10**10' do
    expect(self_power 10).to eq 10000000000
  end
end

describe 'last_ten_digits_of' do
  it 'returns the last ten digits of 123456789012345678' do
    expect(last_ten_digits_of 123456789012345678).to eq '9012345678'
  end
end

describe 'last_ten_of_self_power_series' do
  it 'returns the last ten digits of 1**1 +...10**10' do
    expect(last_ten_of_self_power_series 10).to eq '0405071317'
  end
  it 'returns the last ten digits of 1**1 +...1000**1000' do
    expect(last_ten_of_self_power_series 1000).to eq '9110846700'
  end
end