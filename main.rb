class CellularAutomata
  attr_accessor(:rule)

  def transform(line)
    result = Array.new(line.length, false)
    line.each_with_index do |b, i|
      pattern = Array.new(3)
      pattern[0] = i == 0 ? line.last : line[i - 1]
      pattern[1] = line[i]
      pattern[2] = (i == line.length - 1)? line.first : line[i + 1]
      result[i] = @rule[pattern[0] << 2 | pattern[1] << 1 | pattern[2]]
    end
    result
  end

  def initialize(rule, width, iterations)
    @rule = rule
    line = Array.new(width, 0b0)
    # initial condition
    line[49] = 0b1
    pr line
    (0..iterations).each do |i|
      line = transform(line)
      pr line
    end
  end

  def pr(line)
    puts line.map{|c| c == 0b1 ? "█" : " "}.join
  end
end

def go
  CellularAutomata.new(30, 100, 50)
end