def special_pyth_trip_product

  pythagorean_triplets = (334..997).flat_map do |c|
      (2...c).map do |b|
        if b + c < 1000
          a = 1000 - b - c
          if a**2 + b**2 == c**2
            return a,b,c,a*b*c
          end
        end
      end
    end

  pythagorean_triplets.compact.uniq
end


describe 'special_pyth_trip_product' do
  it 'gives the triplet and the product' do
    expect(special_pyth_trip_product).to eq [200,375,425,0]
  end
end