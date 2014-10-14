def diff_sum_sq_sq_sum range
  range.to_a.reduce(:+)**2 - range.to_a.inject(0){|s, v| s += v**2}
end

 

describe 'diff_sum_sq_sq_sum' do
  it 'gives the difference between sum of squares and square of sums for 1..10' do
    expect(diff_sum_sq_sq_sum 1..10).to eq(2640)
  end
  it 'gives the difference between sum of squares and square of sums for 1..100' do
    expect(diff_sum_sq_sq_sum 1..100).to eq(25164150)
  end
end