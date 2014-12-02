word_list = File.read(File.open('./data/p042_words.txt')).gsub('"','').split(',')

def count_triangles word_list
  count = 0
  word_list.each do |word|
    w = CodedT.new(word)
    count += 1 if w.triangle?
  end
  count
end

class CodedT
  attr_accessor :word, :coded_triangle

  def initialize word
    @word = word
  end

  def decoded
    @word.upcase.split('').map{|l| l.ord - "A".ord + 1}.reduce(:+)
  end

  def triangle?
    n = Math.sqrt(decoded * 2).floor
    decoded == n*(n+1)/2
  end
end

describe 'CodedT' do
  let(:word) {CodedT.new('SKY')}
  describe 'decode' do
    it 'gives the numberical value of a word' do
      expect(word.decoded).to eq 55
    end
  end
  describe 'triangle' do
    it 'returns true for a triangle number' do
      expect(word.triangle?).to eq true
    end
    it 'returns false for a non triangle number' do
      not_triangle = CodedT.new('D')
      expect(not_triangle.triangle?).to eq false
    end
  end
end

describe 'words.txt' do
  it 'counts the triangle words' do
    expect(count_triangles word_list).to eq 0
  end
end
