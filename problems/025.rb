def first_fib_term n
  fib = [1, 2]
  while fib.last.to_s.size < n
    fib << fib[-1] + fib[-2]
  end
  fib.size + 1
end

describe 'first_fib_term' do
  it 'gives the first term with 3 digits' do
    expect(first_fib_term 3).to eq 12
  end
  it 'gives the first term with 1000 digits' do
    expect(first_fib_term 1000).to eq 4782
  end
end
