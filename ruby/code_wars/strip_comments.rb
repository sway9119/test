def solution(input, markers)
  markers.each do |marker|
    marker_start = input.index(marker) -1
    marker_end = input.index("\n", marker_start) 
    marker_end = input.length if marker_end == nil
    input.slice!(marker_start...marker_end)
  end
  return input
end


def checkComments(input, markers, expected)
  actual = solution(input, markers)
  Test.assert_equals(actual, expected, "Returned '#{actual}' but expected '#{expected}'")
end

checkComments("apples, plums % and bananas\npears\noranges !applesauce", ["%", "!"], "apples, plums\npears\noranges")
checkComments("Q @b\nu\ne -e f g", ["@", "-"], "Q\nu\ne")


# リファクタリング
def solution(input, markers)
  input.gsub(/\s+[#{markers.join}].*/, "")
end

# パターンマッチ的な課題は正規表現で解決できる。
