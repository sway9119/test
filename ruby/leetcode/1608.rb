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
# ランタイム 81MS
# メモリ 213.23MB


# リファクタリング
