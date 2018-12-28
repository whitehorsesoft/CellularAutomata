# pattern is a tribit (3 bits) in string form, rule is octet as base-10 in int form
def f1(pattern, rule)
  # convert rule to bit array, then to array of strings, with each string being "0" or "1"
  match_arr = sprintf("%0.8b", rule).chars
  # reverse rule, then match pattern to rule - pattern is 3 bits
  result = match_arr.reverse[pattern.to_i(2)]
  return result
end

def transform(line, rule)
  result = Array.new(line.length, "0")
  line.each_with_index do |b, i|
    pattern = Array.new(3)
    pattern[0] = i == 0 ? line.last : line[i - 1]
    pattern[1] = line[i]
    pattern[2] = (i == line.length - 1)? line.first : line[i + 1]
    result[i] = f1(pattern.join, rule)
  end
  result
end

def go
  line = Array.new(60, "0")
  # initial condition
  line[29] = "1"
  pr line
  (0..19).each do |i|
    line = transform(line, 30)
    pr line
  end
end

def pr(line)
  puts line.map{|c| c == "1" ? "█" : " "}.join
end