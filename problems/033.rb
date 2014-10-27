def digit_canceling_fractions
  dcf = []
  (1..9).each do |i|
    (1..9).each do |j|
      (1..9).each do |k|
        numerator = (i.to_s + j.to_s).to_i
        denominator = (j.to_s + k.to_s).to_i
        if Rational(numerator, denominator) == Rational(i,k) && Rational(i,k) < 1
          dcf << Rational(numerator,denominator)
        end
      end
    end
  end
  dcf
end


describe 'digit_canceling_fractions' do
  it 'gives the fractions that are equal when digits are canceled' do
    expect(digit_canceling_fractions).to eq [Rational(1,4), Rational(1,5), Rational(2,5), Rational(1,2)]
  end
  it 'gives the product in lowest common terms' do
    dcf = digit_canceling_fractions
    expect(dcf.reduce(:*)).to eq Rational(1,100)
  end
end