def find_all(sum_number, digit)
  count = 0 # n桁の数字の個数
  min = 0 # n桁の数字の最低値
  max = 0 # n桁の数字の最大値
  
  # 
  result = make_array(sum_number, digit)
  result = [count, min, max]
  return result
end
  
def make_array(sum_number, digit)
  result = []
  str = ""
  digit.times do
    str << "0"
  end
  limit = "1" + str
  n = limit.chop.to_i
  limit = limit.to_i
  while n < limit
    result << n if n.digits.sum === sum_number
    n += 1
  end
  return result
end