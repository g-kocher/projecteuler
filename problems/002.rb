def even_fib_sums max
  sum(evens_only(fib_seq(max)))
end

def evens_only array
  array.delete_if{|i| i%2 != 0}
end

def sum array
  array.inject(0){|sum, i| sum += i}
end

def fib_seq max
  array = [1,2]
  while array.last <= max
    array << array[-1] + array[-2]
  end
  array[0..-2]
end



describe 'fib_seq' do
  it 'returns the fibonachi sequence up to 9' do
    expect(fib_seq(9)).to eq([1,2,3,5,8])
  end
end

describe 'evens_only' do
  it 'selects only even numbers from arrays' do
    a = (1..9).to_a
    expect(evens_only(a)).to eq([2,4,6,8])
  end
end

describe 'sum' do
  it 'returns the sum of an array' do
    a = (1..3).to_a
    expect(sum(a)).to eq(6)
  end
end

describe 'sum of evens in fib' do
  it 'returns the sum of the even-valued terms up to 4M in the fibonachi sequence' do
    expect(even_fib_sums 4000000).to eq(4613732)
  end
end
