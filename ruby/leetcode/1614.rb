# @param {String} s
# @return {Integer}
def max_depth(s)
  depth = 0
  array = []
  chars = s.split('')
  chars.map do |char|
    depth += 1 if char == '('
    depth -= 1 if char == ')'
    array << depth
  end
  array.max
end

puts max_depth("(1+(2*3)+((8)/4))+1")
# -> 3

# リファクタリング
# ワンライナーだからいいというわけではないが...
def max_depth(s)
  return s.tr('^()','')
          .chars
          .map{ |c| c == '(' ? 1 : -1 }
          .inject([]){ |acc, x| acc << acc.last.to_i + x }
          .push(0)
          .max
end

puts max_depth2("(1+(2*3)+((8)/4))+1")
# -> 3
