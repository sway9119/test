def sum_two_smallest_numbers(numbers)
  arr = numbers.sort
  return arr[0] + arr[1]
end

describe "Solution" do
  it "Fixed tests" do
    Test.assert_equals(sum_two_smallest_numbers([5, 8, 12, 18, 22]), 13) 
    Test.assert_equals(sum_two_smallest_numbers([7, 15, 12, 18, 22]), 19) 
    Test.assert_equals(sum_two_smallest_numbers([25, 42, 71, 12, 18, 22]), 30) 
  end
end

# リファクタリング
def sum_two_smallest_numbers(numbers)
  numbers.min(2).reduce(:+)
end