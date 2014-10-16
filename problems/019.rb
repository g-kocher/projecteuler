def first_day_sunday year1, year2

  (year1..year2).map do |y|
    (1..12).map{|m| Time.new(y, m, 1).sunday? ? 1 : 0}
  end.flatten.reduce(:+)

end

describe 'first_day_sunday?' do
  it 'gives the number of sundays at the begning of a month' do
    expect(first_day_sunday 1901, 2000).to eq 171
  end
end