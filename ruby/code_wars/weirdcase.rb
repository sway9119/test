def weirdcase string
  count = 0
  result = ""
  string.chars.map do |w|
    result += count % 2 == 0 ? w.upcase : w
    w.match(/\s/) ? count = 0 : count += 1
  end
  return result
end

describe 'weirdcase' do
  it 'should return the correct value for a single word' do
    Test.assert_equals(weirdcase('This'), 'ThIs');
    Test.assert_equals(weirdcase('is'), 'Is');
  end
  it 'should return the correct value for multiple words' do
    Test.assert_equals(weirdcase('This is a test'), 'ThIs Is A TeSt');
  end
end

# リファクタリング
def weirdcase string
  string.gsub(/\w{1,2}/) { $&.capitalize }
end

# gsubで文字列のみマッチさせて、大文字にすればよかったのか。