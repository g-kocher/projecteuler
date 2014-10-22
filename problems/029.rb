def distinct_powers a, b
  root = (a..b).to_a
  power = (a..b).to_a
  root.map{|r| power.map{|p| r**p} }.flatten.uniq.sort
end

describe 'distinct_powers' do
  it 'gives the distinct powers 2..5**2..5' do
    expect(distinct_powers 2,5).to eq [4,8,9,16,25,27,32,64,81,125,243,256,625,1024,3125]
  end
  it 'gives the number of distinct terms for 2..5**2..5' do
    expect(distinct_powers(2,5).count).to eq 15
  end
  it 'gives the number of distinct powers 2..100**2..100' do
    expect(distinct_powers(2,100).count).to eq 9183
  end

end
