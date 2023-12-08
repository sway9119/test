# @param {Integer[]} nums
# @return {Integer}
# Runtime 81MS
# Memory 213.23MB
def special_array(nums)
  length = nums.length
  array = Array.new(length)
  length.downto(1) {|i|
    count = 0
    nums.map{|num| count += 1 if num >= i}
    array[i] = count
  }
  array.each_with_index {|c,i| return c if c == i}
  return -1
end
special_array([0,4,3,0,4])

# リファクタリング
# Runtime 77ms
# Memory 211.79MB
def special_array(nums)
  length = nums.length
  array = Array.new(length)
  length.downto(1) {|i|
    count = 0
    nums.map{|num| count += 1 if num >= i}
    return count if count == i
  }
  return -1
end

# Runtime 58ms
# Memory 211.74MB
def special_array(nums)
  nums.length.downto(1) {|i|
    count = 0
    nums.map{|num| count += 1 if num >= i}
    return count if count == i
  }
  return -1
end

# Leetcode: 1608. Special Array With X Elements Greater Than or Equal X.
# https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/
# Runtime: 64 ms, faster than 65.91% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# Memory Usage: 209.7 MB, less than 77.27% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
  (0..nums.size).each do |i|
      return i if i == nums.count{|x| x >= i}
  end
  -1
end
# Leetcode: 1608. Special Array With X Elements Greater Than or Equal X.
# https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/
# Runtime: 60 ms, faster than 70.45% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# Memory Usage: 209.7 MB, less than 95.45% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
  (0..100).each do |i|
      return i if i == nums.count{|x| x >= i}
  end
  -1
end
# Leetcode: 1608. Special Array With X Elements Greater Than or Equal X.
# https://leetcode.com/problems/special-array-with-x-elements-greater-than-or-equal-x/
# Runtime: 48 ms, faster than 90.91% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# Memory Usage: 209.7 MB, less than 95.45% of Ruby online submissions for Special Array With X Elements Greater Than or Equal X.
# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
  nums.sort!
  (0..100).each do |i|
      return i if i == nums.count{|x| x >= i}
  end
  -1
end