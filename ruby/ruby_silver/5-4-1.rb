# Numericクラス
# ceil: 自身と同じかそれ自身より大きな整数のうち、最小のものを返す。切り上げ。
p 1.9.ceil #=> 2
p -1.1.ceil #=> -1

# floor: それ自身より小さな整数のうち、最大のものを返す。切り捨て。
p 1.9.floor #=> 1
p -1.1.floor #=> -2

# round: 最も近い整数を返す。四捨五入。
p 1.9.round #=> 2
p -1.1.round #=> -1

# truncate: それ自身と0の間位にある整数で最も近いものを返す。
p 1.9.truncate #=> 1
p -1.1.truncate #=> -1

# abs: 絶対値を返す。
p -3.abs #=> 3

