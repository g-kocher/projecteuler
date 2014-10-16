def power_digit_sum digit, power
  n = digit ** power
  n.to_s.split(//).map{|i| i.to_i}.reduce(:+)
end



describe 'power_digit_sum' do
  it 'gives the sum of the digits in 2**15' do
    expect(power_digit_sum 2, 15).to eq 26
  end
  it 'gives the sum of the digits in 2**10' do
    expect(power_digit_sum 2, 1000).to eq 1366
  end  
end