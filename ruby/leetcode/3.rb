# 3. Longest Substring Without Repeating Characters

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  chars = s.split("")
  target = ""
  targets = []
  ret = ""
  chars.each { |char|
    # 文字が文字列内に含まれない場合、文字列整形、それ以外は文字列登録
    unless target.include?(char)
      target = target.concat(char)
    else 
      # 文字列を配列に登路する
      targets.push(target)
      index = target.index(char) + 1
      target = target.slice(index..) + char
    end
    targets.push(target)
  }
  unless targets.empty?
    ret = targets.max {|a, b| a.length <=> b.length}
  end
  ret.length
end

# @param {String} s
# @return {Integer}
def length_of_longest_substring(str)
  max = 0
  sub_str = []
  str.each_char do |c|
    if sub_str.include?(c)
      i = sub_str.index(c)
      max = sub_str.length if sub_str.length > max
      sub_str = sub_str.slice(i+1..)
    end
    sub_str << c
  end
  max = sub_str.length if sub_str.length > max
  max
end