def printA	# 定義
  puts "A"
end

printA  # 実行

def getNum	# 定義
  2 + 1   # return を書かなくても良い場合がある
end

puts getNum  # 実行

def area(x, y) 	# 引数ありで定義
  x * y
end

puts area(10, 20) # 引数を添えて実行