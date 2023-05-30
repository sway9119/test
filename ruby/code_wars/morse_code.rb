def decodeMorse(morseCode)
  str = morseCode 
  
  # 特殊文字列は先に置換
  str = str.gsub("...---...", "SOS")
  str = str.gsub("-.-.--", "!") 
  
  # 特殊文字「.」は待避
  str = str.gsub(".-.-.-", "dot") 
  
  # word 4
  str = str.gsub(".---","J")
  str = str.gsub("-.--","Y")
  str = str.gsub("--.-","Q")
# str = str.gsub("---.","")
  str = str.gsub("...-","V")
  str = str.gsub("..-.","F")
  str = str.gsub(".-..","L")
  str = str.gsub("-...","B")
  str = str.gsub(".--.","P")
  str = str.gsub("-..-","X")
  str = str.gsub("--..","Z")
  str = str.gsub("-.-.","C")
  str = str.gsub("....", "H")
  
  # word 3
  str = str.gsub("---","O")
  str = str.gsub(".--","W")
  str = str.gsub("-.-","K")
  str = str.gsub("--.","G")
  str = str.gsub("..-","U")
  str = str.gsub("-..","D")
  str = str.gsub(".-.","R")
  str = str.gsub("...","S")
  
  # word 2  
  str = str.gsub(".-","A")
  str = str.gsub("..","I")
  str = str.gsub("--","M")
  str = str.gsub("-.","N")
  
  # word 1
  str = str.gsub(".","E")
  str = str.gsub("-","T")  
  
  # 行頭、行末の空白を削除
  str = str.gsub(/^\s{2,}/,"")
  str = str.gsub(/\s{2,}$/,"")
  
  # 空白文字が2回以上は空白として待避
  str = str.gsub(/\s{2,}/,"space")  

  # 空白文字を削除
  str = str.gsub(/\s/,"")
  
  # 対比した文字列を置換
  str = str.gsub("space"," ")
  str = str.gsub("dot",".")

  return str
end

# リファクタ
# strip: 文字列先頭と末尾の空白文字を全て取り除いた文字列を生成して返します
# MORSE_CODE: モールスコードのハッシュがある
def decodeMorse2(morseCode)
  morseCode.strip
  				 .split('   ')
  				 .map { |word| decodeWord(word) }
           .join(' ')
end

private

def decodeWord(morseCode)
  morseCode.split
           .map { |char| MORSE_CODE[char] }
           .join
end