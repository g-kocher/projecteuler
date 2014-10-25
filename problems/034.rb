def digit_factorials
  factorials = (0..9).map{|i| i > 0 ? (1..i).inject(:*) : 1 }
  dig_fact = []
  (10..(factorials.last*9)).each do |i|
    digits = i.to_s.split('').map(&:to_i)
    fact_sum = digits.map{|i| factorials[i] }.inject(:+)
    dig_fact << i if i == fact_sum
  end
  dig_fact.inject(:+)
end


describe "digit_factorials" do
  it 'gives the digit factoials through 1000' do
    expect(digit_factorials).to eq 40730
  end
end