def zeros(n)
  p "fact: #{fact(n)}"
  a = fact(n).to_s.split("").reverse
  i = 0
  count = 0
  p a
  while a[i] === "0"
    p a[i]
    count += 1
    i += 1
  end
  p count
  return count
end

def fact(n)
  (1..n).to_a.inject(1) {|f, i| f*i}
end

# 上記の方法だとオーバーフローするため他の方法を調べる。
# 素因数分解をして5（＝5＊2で10なのだが5＞2個となるため2は省略）が含まれている個数数えればいいらしい。

def zeros(n)
  count = 0
  i = 5
  while n / i >= 1
    count += n / i
    i *= 5
  end
  return count
end


describe "Sample Tests" do
  it "Should pass sample tests" do
    Test.assert_equals(zeros(0), 0, "Testing with n = 0")
    Test.assert_equals(zeros(6), 1, "Testing with n = 6")
    Test.assert_equals(zeros(30), 7, "Testing with n = 30")
  end  
end


# リファクタリング
def zeros2(n)
	n < 5 ? 0 : (n / 5) + zeros2(n / 5)
end

# 階乗的なものは再帰的に処理する。
# 再帰関数 + 三項演算子の組み合わせはスタイリッシュ。
# zeros2(100)
# n < 5 -> false
# (100/5) + zeros2(100/5) -> 20 + zeros2(20)
# n < 5 -> false
# (20/5) + zeros2(20/5) -> 4 + zeros2(4)
# n < 5 -> true -> return 0
# (20/5) + 0 -> return 4
# (100/5) + 4 -> return 24