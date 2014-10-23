def n_powers_sum power
  numbers = []
  2.upto(10**(power+1)).each do |number|
    power_sum = number.to_s.split('').map{|d| d.to_i**power }.inject(:+)
    numbers << number if number == power_sum
  end
  numbers.inject(:+)
end

describe 'n_powers_sum' do
  it 'gives numbers = digit**4' do
    expect(n_powers_sum 4).to eq 19316
  end
  it 'gives numbers = digit**5' do
    expect(n_powers_sum 5).to eq 443839
  end
end