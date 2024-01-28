# Intuition
# O(n^2) solution is trivial and O(n) solution is boring. Let's see what other ones we can do!

# Approach
# I tried to have as reasonable a solution I could for every common time complexity above O(n). Every solution here passes the basic test cases, but only the last one is fast enough to pass all tests.

# Complexity
# Time complexity:
# O(n3)O(n^3)O(n 
# 3
#  )
# O(n!)O(n!)O(n!)
# O(nn)O(n^n)O(n 
# n
#  )
# O(2n)O(2^n)O(2 
# n
#  )
# O(n∗log(n))O(n * log(n))O(n∗log(n))

# Space complexity:
# O(1)O(1)O(1)
# O(n!)O(n!)O(n!)
# O(nn)O(n^n)O(n 
# n
#  )
# O(2n)O(2^n)O(2 
# n
#  )
# I'm not sure about the last one, but I think O(n)O(n)O(n) because I'm changing each element of a 2-element array.

# O(n^3)
# like O(n^2) solution, but check for repeat elements in O(n) in each loop
def two_sum1(nums, target)
    nums.each_with_index do |num,i|
        nums.each_with_index do |num2,j|
            return [i,j] if ((nums.count { |n| n == num } > 1 &&
                            i != j) ||
                            num != num2) &&
                            num + num2 == target   
        end
    end
end

# O(n!)
# find all possible arrangements, then check first two numbers for each
def two_sum2(nums, target)
    n = nums.length
    arr = (0...n).to_a
    perms = arr.permutation.to_a
    perms.each do |perm|
        return perm[0..1] if nums[perm[0]] + nums[perm[1]] == target
    end
end


# O(n^n)
# find all possible arrangements (with repeats), then check first two
def two_sum3(nums, target)
    indices = (0...nums.length).to_a
    selections = [[]]
    until selections[0].length == nums.length
        new_selections = []
        selections.each do |selection|
            indices.each do |index|
                new_selections << selection + [index]
            end
        end
        selections = new_selections
    end
    selections.each do |selection|
        if nums[selection[0]] + nums[selection[1]] == target
            return selection[0..1] if selection[0] != selection[1]
        end
    end
end



# O(2^n)
# find all subsets, then check the subsets of length 2
def two_sum4(nums, target)
    indices = (0...nums.length).to_a
    combos = combinations(indices)
    combos.each do |combo|
        if combo.length == 2
            return combo if nums[combo[0]] + nums[combo[1]] == target
        end
    end
end

def combinations(arr)
    combos = [[]]
    arr.each do |ele|
        combos += combos.map { |combo| combo + [ele] }
    end
    combos
end



# O(n log(n))
# sort the array (preserving original index), then two-pointer stategy
def two_sum5(nums, target)
  # 各要素とそのインデックスを紐付ける
  nums.each_with_index { |n, i| nums[i] = [n, i] }
  
  # 配列を要素の値でソート
  nums.sort_by! { |sub_arr| sub_arr[0] }
  
  i = 0
  j = nums.length - 1
  
  # 先頭と末尾から合計が目標値になる組み合わせを探す
  while i < j
    sum = nums[i][0] + nums[j][0]
    return [nums[i][1], nums[j][1]] if sum == target
    
    if sum > target
        j -= 1
    else
        i += 1
    end
  end
end

# main
require 'active_support'
require 'active_support/core_ext/benchmark'
result = Benchmark.ms do
  nums = (1..1000).to_a
  target = 1999
  # result = two_sum1(nums, target) # 処理概要 24501.22901ms
  result = two_sum5(nums, target)   # 処理概要 0.31701ms
end
puts "処理概要 #{result.ceil(5)}ms"

