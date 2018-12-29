module CellularAutomata
  refine Array do
    def transform(rule)
      result = Array.new(self.length, false)
      self.each_with_index do |b, i|
        pattern = Array.new(3)
        pattern[0] = i == 0 ? self.last : self[i - 1]
        pattern[1] = self[i]
        pattern[2] = (i == self.length - 1)? self.first : self[i + 1]
        result[i] = rule[pattern[0] << 2 | pattern[1] << 1 | pattern[2]]
      end
      result
    end
  end
end

using CellularAutomata

class Go
  def initialize
    line = Array.new(60, 0b0)
    # initial condition
    line[29] = 0b1
    pr line
    (0..19).each do |i|
      line = line.transform(30)
      pr line
    end
  end

  def pr(line)
    puts line.map{|c| c == 0b1 ? "█" : " "}.join
  end
end
