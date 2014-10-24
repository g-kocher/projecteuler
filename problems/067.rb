small = "3
7 4
2 4 6
8 5 9 3"

test = '75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23'

problem067 = File.read(File.open("./data/p067_triangle.txt"))

class Max_path
  def initialize array
    @array = array.each_line.map{|line| line.split().map(&:to_i)}.reverse
  end

  def sum
    array = @array.dup
    until array.size == 1
      max = array.shift.each_cons(2).map(&:max)
      array[0] = array[0].zip(max).map{|i,j| i+j }.flatten
    end
    array.flatten.first
  end

end


describe Max_path do
  it 'gives the max path for the example' do
    expect(Max_path.new(small).sum).to eq 23
  end
  it 'gives the max path for the problem' do
    expect(Max_path.new(test).sum).to eq 1074
  end
  it 'gives the max path for #067' do
    expect(Max_path.new(problem067).sum).to eq 7273
  end

end
