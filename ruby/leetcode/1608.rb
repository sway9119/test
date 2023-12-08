# @param {Integer[]} nums
# @return {Integer}
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
# Runtime 81MS
# Memory 213.23MB

# リファクタリング
def special_array1(nums)
  length = nums.length
  array = Array.new(length)
  length.downto(1) {|i|
    count = 0
    nums.map{|num| count += 1 if num >= i}
    return count if count == i
  }
  return -1
end
# Runtime 77ms
# Memory 211.79MB

def special_array2(nums)
  nums.length.downto(1) {|i|
    count = 0
    nums.map{|num| count += 1 if num >= i}
    return count if count == i
  }
  return -1
end
# Runtime 58ms
# Memory 211.74MB