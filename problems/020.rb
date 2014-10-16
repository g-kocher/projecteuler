def factorial n
  (1..n).inject(:*)
end

def digit_sum n
  n.to_s.split(//).map{|i| i.to_i }.reduce(:+)
end


describe 'factorial_digit_sum' do
  it 'gives the sum of 10!' do
    expect(digit_sum factorial(10)).to eq 27
  end

  it 'gives the sum of 100!' do
    expect(digit_sum factorial(100)).to eq 648
  end
end
