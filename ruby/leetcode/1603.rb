# Time: 00:40:17
# Runtime 96ms
# Beats 66.67% of users with Ruby
class ParkingSystem
  # :type big: Integer
  # :type medium: Integer
  # :type small: Integer
  def initialize(big, medium, small)
    @big = Array.new(big)
    @medium = Array.new(medium)
    @small = Array.new(small)
  end

  # :type car_type: Integer
  # :rtype: Boolean
  def add_car(car_type)
    ret = false
    if car_type === 1 && @big.include?(nil)
      @big.shift(1)
      ret = true
    elsif car_type === 2 && @medium.include?(nil)
      @medium.shift(1)
      ret = true
    elsif car_type === 3 && @small.include?(nil)
      @small.shift(1)
      ret = true
    end
    ret
  end
end

# Your ParkingSystem object will be instantiated and called as such:
# obj = ParkingSystem.new(big, medium, small)
# param_1 = obj.add_car(car_type)


# リファクタリング
# 大: 1, 中: 2, 小: 3
# で渡ってくるからといってindexにするのは好きじゃない
class ParkingSystem
  def initialize(big, medium, small)
      @space = [big, medium, small]
  end

  def add_car(car_type)
      -1 < @space[car_type - 1] -= 1
  end
end