def getASCII(c)
  c.bytes.to_a[0]
end

# 別解
def getASCII(c)
  c.ord
end

# ASCIIコード
# 最も基礎となっている文字コードです。数字・アルファベット・記号をそれぞれ１バイトで表現しており、これらの文字の他に改行コードやタブ文字、制御コードなどが存在します。

Test.assert_equals(getASCII('L'),76)
Test.assert_equals(getASCII('M'),77)
Test.assert_equals(getASCII('N'),78)
Test.assert_equals(getASCII('#'),35)
Test.assert_equals(getASCII('$'),36)
Test.assert_equals(getASCII('%'),37)