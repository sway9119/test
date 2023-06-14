def reverse_words(str)
  str.split(/([a-zA-Z.!]+|\s+)/).map{|w| w.reverse!}.join
end

describe "Solution" do
  it "Fixed tests" do
    Test.assert_equals(reverse_words('The quick brown fox jumps over the lazy dog.'), 'ehT kciuq nworb xof spmuj revo eht yzal .god')
    Test.assert_equals(reverse_words('apple'), 'elppa')
    Test.assert_equals(reverse_words('a b c d'), 'a b c d')
    Test.assert_equals(reverse_words('double  spaced  words'), 'elbuod  decaps  sdrow')
  end
end

# リファクタリング
def reverse_words(str)
  str.gsub(/\S+/, &:reverse)
end

def reverse_words(str)
  str.split(/(\s+)/).map(&:reverse).join
end