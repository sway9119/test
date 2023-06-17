# requireとloadについて
# laodは'相対パス + 拡張子'
# requireは'./ + 相対パス'
# → しかし、Ruby1.9.2から'./'が先頭に無いと読み込みエラーとなる。
# require_relativeというものなら相対パスのみでOK
# requireは何度実行しても1回しか実行しない。

puts 'start'
load '2-3-2_test.rb'
# require "2-3-2_test" ← LoadErrorとなる
require "./2-3-2_test"
require_relative "2-3-2_test" # 上記のrequireで読み込まれ済みのため実行されない
puts "end"