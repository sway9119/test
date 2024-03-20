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

# この問題をより少ない計算量で解決するために、Manacher's Algorithm（マナカーのアルゴリズム）を使用することができます。
# このアルゴリズムは、回文の長さを線形時間 O(n) で計算します。
def longest_palindrome(s)
  return "" if s.empty?

  # 文字列を変換して計算を簡単にする
  processed_s = pre_process(s)
  # 各文字を中心とする最長回文の長さを記録する配列
  palindromes = [0] * processed_s.length

  center = right = max_center_index = max_length = 0
  (1...processed_s.length - 1).each do |i|
    # 中心からの対称位置を求める
    mirror = 2 * center - i

    # 現在のインデックスが右端より内側にある場合、
    # 中心を現在の位置に更新し、右端を更新する
    if i < right
      palindromes[i] = [right - i, palindromes[mirror]].min
    end

    # 中心を中心に回文の長さを拡張する
    while processed_s[i + (1 + palindromes[i])] == processed_s[i - (1 + palindromes[i])]
      palindromes[i] += 1
    end

    # 現在の位置が現在の右端を超えている場合、中心と右端を更新する
    if i + palindromes[i] > right
      center = i
      right = i + palindromes[i]
    end

    # 最長回文の長さと中心のインデックスを記録する
    if palindromes[i] > max_length
      max_length = palindromes[i]
      max_center_index = i
    end
  end

  # 元の文字列から最長回文を抽出する
  start_index = (max_center_index - 1 - max_length) / 2
  s[start_index...(start_index + max_length)]
end

def pre_process(s)
  processed_s = "^#"
  s.each_char { |c| processed_s << c << "#" }
  processed_s << "$"
end
