# 再帰関数は、
# 1.終了条件を書く
# 2.処理を書く
# 3.終了条件へいくデクリメントな処理を書く　例）i -= 1
# 4.再帰関数自体を呼ぶ
#   この時、終了条件へ向かう処理が必ず起こる事。

def saiki(array)
    return 0 if array.empty? # 1.終了条件を書く
    top = array.shift        # 3.終了条件へいくデクリメントな処理を書く　例）i -= 1
    top + saiki(array)       # 4.再帰関数自体を呼ぶ
end

array = [1,2,3,4,5]
puts saiki(array)
puts array # arrayの中身は消えてしまう。