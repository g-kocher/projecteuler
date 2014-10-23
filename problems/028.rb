def number_spiral_diagonal dimension
  spirals = (dimension - 1)/2 + 1
  sum = 0
  (1..spirals).each do |spiral|
    if spiral == 1
      sum += 1
    else
      (0..3).each{|n| sum += (2*spiral -1)**2 - (2*(spiral-1)*n)}
    end
  end
  sum
end



describe 'number_spiral_diagonal' do
  it 'gives the sum of the diagonals in 5x5 spiral' do 
    expect(number_spiral_diagonal 5).to eq 101
  end
  it 'gives the sum of the diagonals in a 1001x1001 spiral' do
    expect(number_spiral_diagonal 1001).to eq 669171001
  end
end
