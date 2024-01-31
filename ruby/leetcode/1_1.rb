require 'active_support'
require 'active_support/core_ext/benchmark'
require 'timeout'

# n個の配列に対して、n回の処理
def order_n(nums)
  for num in nums
    @count += 1
  end
end

# n個の配列に対して、n^2回の処理
def order_n_multi_2(nums)
  for i in 0...nums.length
    for j in 0...nums.length
      @count += 1
    end
  end
end

# n個の配列に対して、n^3回の処理
def order_n_multi_3(nums)
  for i in 0...nums.length
    for j in 0...nums.length
      for k in 0...nums.length
        @count += 1
      end  
    end
  end
end

# n個の配列に対して、2^n回の処理
def order_2_multi_n(nums)
  (2**nums.length).times do
    @count += 1
  end
end

# n個の配列に対して、n!回の処理
def order_n_recurse(nums)
  # TODO: 再帰処理の実装
end

def order_log_n(nums)
  # TODO: 二分探索処理の実装
  nums.each_with_index { |n,i| nums[i] = [n,i] }
  nums.sort_by! { |sub_arr| sub_arr[0] }
  i = 0
  j = nums.length - 1
  while i < j
      sum = nums[i][0] + nums[j][0]
      return [nums[i][1],nums[j][1]] if sum == target
      if sum > target
          j -= 1
      else
          i += 1
      end
  end
end


class Test
  @count = 0

  def self.run(nums)
    [
      :order_n,
      :order_n_multi_2,
      :order_n_multi_3,
      :order_2_multi_n,
      :order_n_recurse,
      :order_log_n
    ].each do |method|
      Timeout.timeout(1) do
        result = Benchmark.ms do
          @count = 0
          send(method, nums)
        end

        puts "------------------------------"
        puts method.to_s
        puts "計算量: #{@count}"
        puts "処理概要: #{result.ceil(5)}s"
        puts "------------------------------"
      end
    rescue Timeout::Error
      puts "------------------------------"
      puts method.to_s
      puts "処理が一定時間を超えたので停止します。"
      puts "------------------------------"
    end
  end
end

n = 25
nums = (1..n).to_a
Test.run(nums)

# n=15; n!が使えなくなる
# n=25: 2^nが使えなくなる
# n=1,000: n^3が使えなくなる
# n=100,000: n^2が使えなくなる
