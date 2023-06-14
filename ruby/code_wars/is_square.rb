def is_square(x)
  return false if x < 0
  return true if x == 0
  result = false
  num = 1
  while x+1 > num**2
    puts num
    if x == num**2 
      result = true
    end
    num += 1
  end
  p result
  return result
end

describe "is_square" do
  it "should work for some examples" do
    Test.assert_equals (is_square (-1)), false, "-1 is not a perfect square"
    Test.assert_equals (is_square  0),   true,  "0 is a perfect square (0 * 0)"
    Test.assert_equals (is_square  3),   false,  "3 is not a perfect square"
    Test.assert_equals (is_square  4),    true,   "4 is a perfect square (2 * 2)"
    Test.assert_equals (is_square 25),    true,  "25 is a perfect square (5 * 5)"
    Test.assert_equals (is_square 26),   false, "26 is not a perfect square"
  end 
end


# リファクタリング
def is_square(x)
  x < 0 ? false : Math.sqrt(x) % 1 == 0
end

def is_square(x)
  return false if x < 0
  (x ** 0.5) % 1 == 0
end