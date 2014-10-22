names = File.read(File.open('./data/p022_names.txt')).gsub('"','').split(',').sort

def alpha_value name
  name.chars.map{|c| c.upcase.ord - 'A'.ord + 1}.inject(:+)
end

def name_score names
  score = 0
  names.each do |name|
    alpha = alpha_value name
    position = names.index(name) + 1
    score += alpha * position
  end
  score
end

describe 'names' do
  it 'has over 5000 names' do
    expect(names.count).to be >= 5000
  end
end

describe 'alpha_value' do
  it 'gives the alpha score for COLIN' do
    expect(alpha_value "COLIN").to eq 53
  end
end

describe 'name_score' do
  it 'gives the name scores sum' do
    expect(name_score names).to eq 871198282
  end
end

