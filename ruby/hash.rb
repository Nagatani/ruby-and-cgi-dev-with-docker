hash = {
  "A" => 1,
  "B" => 3,
  "C" => 4
}
puts hash["A"]
hash["A"] = 5   # 値の変更
hash["D"] = 9   # 追加
hash[0] = 100
# hashの中身をすべて取り出し
hash.each do | key, value |
  puts "#{key} : #{value}"
end
