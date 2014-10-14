require 'prime'

def n_th_prime n
  Prime.first(n).last
end

describe "n_th_prime" do
  it 'gives the 6th prime number' do
    expect(n_th_prime(6)).to eq(13)
  end
  it 'gives the 10001st prime number' do
    expect(n_th_prime 10001).to eq(104743)
  end
  
end