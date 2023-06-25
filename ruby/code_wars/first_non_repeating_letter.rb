def  first_non_repeating_letter(s) 
  return '' if s.empty?
  d = s.downcase
  a = d.split("").select{ |e| d.count(e) == 1 }.uniq
  return '' if a.empty?
  p s.split("").find{ |w| w if w == a[0].upcase || w == a[0].downcase }
end

describe('Simple Tests') do
  it('should handle simple tests') do
    Test.assert_equals(first_non_repeating_letter('a'), 'a')
    Test.assert_equals(first_non_repeating_letter('stress'), 't')
    Test.assert_equals(first_non_repeating_letter('moonmen'), 'e')
  end
  it('should handle empty strings') do
    Test.assert_equals(first_non_repeating_letter(''), '')
  end
end

# リファクタリング

def  first_non_repeating_letter(s) 
	s.chars.find {|i| s.downcase.count(i)==1 || s.upcase.count(i)==1} || ""
end

# charsで一文字ずつの配列にする。
# findでdowncaseとupcaseのどちらかで1回のみ出現するものを返す。もしくは空文字。
# 一つしか返すものがない場合、それを探しにいくことが最短。
# 重複がある単語を排除した配列を作ろうとするのは、ステップとしては問題ないが、クリティカルではない。