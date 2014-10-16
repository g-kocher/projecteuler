def number_of_routes n
  ((n+1)..(2*n)).inject(:*) / ((1..n).inject(:*))
end


describe 'number_of_routes' do 
  it 'gives number of routes for a 1x1' do
    expect(number_of_routes 1).to eq 2
  end
  it 'gives the number of routes for a 2x2' do
    expect(number_of_routes 2).to eq 6
  end
  it 'gives the number of routes for a 3x3' do
    expect(number_of_routes 3).to eq 20
  end
  it 'gives the number of routes for a 20x20' do
    expect(number_of_routes 20).to eq 137846528820
  end
end
