require 'active_support'
require 'active_support/core_ext/benchmark'
require 'timeout'

# n個の配列に対して、n回の処理
def order_n(nums)
  for num in nums
    @count += 1
  end
end
  def self.run(nums)
    [
      :order_n,
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
