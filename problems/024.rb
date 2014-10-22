def lexicographic_permutation array, n = 0
  perm = array.sort.permutation.map{|i| i.join.to_i}
  if n==0
    perm
  else
    perm[n-1]
  end
end

describe 'lexicographic_permutation' do
  it 'gives the fourth lexicographic_permutation for 0,1,2' do
    expect(lexicographic_permutation [0,1,2], 4).to eq 120
  end
  it 'gives the millionth permutation for 0..9' do
    expect(lexicographic_permutation (0..9).to_a, 1000000).to eq 2783915460
  end
end
