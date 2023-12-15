# @param {Integer} n
# @return {Integer}
def number_of_matches(n)
  result = 0
  team = n
  while team > 1 do
    result += team/2.to_f.floor
    team = (team + 1)/2
  end
  result
end

require 'active_support'
require 'active_support/core_ext/benchmark'
result = Benchmark.ms do
  # 処理
  number_of_matches(5)
end
puts "処理概要 #{result.ceil(5)}s"