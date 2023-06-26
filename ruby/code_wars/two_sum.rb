def two_sum(numbers, target)
  array = []
  numbers.each_with_index do |n, i|
    numbers.each_with_index do |m, j|
     return array = [i, j] if target == n + m && !(i == j)
    end
  end
end

Test.assert_equals(two_sum([1, 2, 3], 4).sort, [0, 2])
Test.assert_equals(two_sum([1234, 5678, 9012], 14690).sort, [1, 2])
Test.assert_equals(two_sum([2, 2, 3], 4).sort, [0, 1])

#  リファクタリング
def twoSum(numbers, target)
  numbers.each_with_index do |n1, i1|
    numbers.each_with_index do |n2, i2|
      return [i1, i2] if (n1 + n2) == target && i1 != i2
    end
  end
end