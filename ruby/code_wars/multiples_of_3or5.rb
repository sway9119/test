def solution(number)
  array3, array5 = []
  array3 = ret_array(3, number)
  array5 = ret_array(5, number)    
  p (array3 + array5).uniq.sum
end

def ret_array(num, limit)
  index = 1
  array = []
  while index * num < limit
    array << index * num
    index += 1
  end
  return array
end

describe("example tests") do
  
  def test(n, expected)
    expect(solution(n)).to eq(expected), "Expected #{expected}, got #{solution(n)}"
  end
  
  it("solution") do
    test(10, 23)
    test(20, 78)
    test(200, 9168)
  end
end

# リファクタリング
def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

# numberを主語にして考える。3か5で割り切れる（＝3か5の倍数）をselectする。
# それぞれの配列を返すのではなく、numberを主語にすること。