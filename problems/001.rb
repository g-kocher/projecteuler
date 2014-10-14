def sum_of_multiples number, m1, m2=m1
  (1...number).to_a.inject(0) do |sum, i|
    if (i % m1) == 0 || (i % m2) == 0
      sum += i
    end
    sum
  end
end


describe 'multiples' do
  it "should find the sum of multiples of 2 below 10" do
    expect(sum_of_multiples(10, 2)).to eq(20)
  end

  it 'should find the sum of multiples of 2 and 3 below 10' do
    expect(sum_of_multiples(10,2,3)).to eq(32)
  end

  it 'should find the sum of the multiples of 3 and 5 below 1000' do
    expect(sum_of_multiples(1000,3,5)).to eq(233168)
  end
end