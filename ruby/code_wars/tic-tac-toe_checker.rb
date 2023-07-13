def is_solved(board)
  result_array = []
  
  # 横列の確認
  result_array << comp(board[0]) if comp(board[0]) > 0
  result_array << comp(board[1]) if comp(board[1]) > 0
  result_array << comp(board[2]) if comp(board[2]) > 0
  
  # 縦列の確認
  result_array << comp(board.transpose[0]) if comp(board.transpose[0]) > 0
  result_array << comp(board.transpose[1]) if comp(board.transpose[1]) > 0
  result_array << comp(board.transpose[2]) if comp(board.transpose[2]) > 0
  
  # 斜めの確認
  left_cross = []
  left_cross << board[0][0]
  left_cross << board[1][1]
  left_cross << board[2][2]
  result_array << comp(left_cross) if comp(left_cross) > 0
  
  right_cross = []
  right_cross << board[0][2]
  right_cross << board[1][1]
  right_cross << board[2][0]
  result_array << comp(right_cross) if comp(right_cross) > 0
  
  if result_array.count(1) == result_array.count(2) && 
    board[0].count(0) == 0 && board[1].count(0) == 0 && board[2].count(0) == 0
    return 0
  elsif result_array.count(1) > 0 then
    return 1
  elsif result_array.count(2) > 0 then
    return 2
  else
    return -1
  end
end

def comp(array)
  return 1 if array[0] == 1 && array[1] == 1 && array[2] == 1
  return 2 if array[0] == 2 && array[1] == 2 && array[2] == 2
  return 0
end  

describe "Solution" do
  it "should test for won and tied games" do
    Test.assert_equals(is_solved([[0,0,1],[0,1,2],[2,1,0]]), -1)
    Test.assert_equals(is_solved([[0,0,1],[2,2,2],[2,1,0]]), 2)
    Test.assert_equals(is_solved([[0,0,1],[2,2,1],[2,1,1]]), 1)
    Test.assert_equals(is_solved([[1,0,1],[0,1,2],[2,1,1]]), 1)
  end
end

# リファクタリング
# 近い書き方
def check_rows(board)
  board.each do |row|
    return 1 if row.all?(1)
    return 2 if row.all?(2)
  end
  nil
end

def check_columns(board)
  check_rows(board.transpose)
end

def check_diag(board)
  diag1 = [board[0][0], board[1][1], board[2][2]]
  diag2 = [board[0][2], board[1][1], board[2][0]]
  check_rows([diag1, diag2])
end

def game_done(board)
  board.each do |row|
    return false if row.any?(0)
  end
  true
end

def is_solved(board)
  rows_winner = check_rows(board)
  columns_winner = check_columns(board)
  diag_winner = check_diag(board)
  return 1 if (rows_winner == 1 || columns_winner  == 1 || diag_winner  == 1)
  return 2 if (rows_winner == 2 || columns_winner  == 2 || diag_winner  == 2)
  return 0 if game_done(board)
  -1
end

# 各判定をメソッドに切り出している。
# 各判定の結果をそれぞれ_winnerとして条件にしている。
# → 勝利条件が4つ以上ある場合、その個数分増えていくのは仕方ないのだろうか。

def is_solved(board)
  case board.join
  when /1..(1|.1.)..1|1.1.1..$|111(...)*$/ then 1
  when /2..(2|.2.)..2|2.2.2..$|222(...)*$/ then 2
  when /0/ then -1
  else 0
  end
end

# joinで全てをフラットにして、正規表現で勝利条件をパターンマッチする。
# case文 & 正規表現は、複数のパターンを判定する際に使える。