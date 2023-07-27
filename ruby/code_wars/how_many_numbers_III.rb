def find_all(sum_number, digit)
  p "#{sum_number} #{digit}"
  count = 0 # n桁の数字の個数
  min = 0 # n桁の数字の最低値
  max = 0 # n桁の数字の最大値
  
  # 
  array = make_array(sum_number, digit)
  count = array.count
  min = array.min
  max = array.max
  return [] if count == 0
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
    if n.digits.sum === sum_number && !n.to_s.include?("0")
      a = n.to_s.split("")
      if a === a.sort_by{|x| x.to_i }  
        result << n
      end
    end
    n += 1
  end
  return result
end



# リファクタリング
def find_all(n, k)
  p = (1..9).to_a.repeated_combination(k).select { |c| c.inject(:+) == n } 
  p.empty? ? [] : [p.size, p.min.join.to_i, p.max.join.to_i] 
end

# repeated_combination: 引数に指定した個数の配列を生成する
# 1〜9で桁数個の全配列を作成
# そのうちinject合計がnの数字をselectした配列をpに代入
# ポイントは全組み合わせの配列を作成するのとイテレータをループするのでは組み込み関数を使うと断然早いということ。
# パフォーマンスを改善したいのなら組み込み関数がないかを調べる必要がある。