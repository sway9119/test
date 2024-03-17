# @param {String} s
# @return {String}
def longest_palindrome(s)
  return "" if s.empty?

  start = 0
  max_length = 1

  (0...s.length).each do |i|
    # 奇数長の回文の中心を基準に拡張する
    length1 = expand_around_center(s, i, i)
    # 偶数長の回文の中心を基準に拡張する
    length2 = expand_around_center(s, i, i + 1)
    
    length = [length1, length2].max
    if length > max_length
      start = i - (length - 1) / 2
      max_length = length
    end
  end

  s[start...(start + max_length)]
end

def expand_around_center(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end
  right - left - 1
end

