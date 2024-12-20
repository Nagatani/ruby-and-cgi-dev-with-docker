#!/usr/bin/env ruby
# coding: UTF-8

# HTTP レスポンスヘッダの出力
print "Content-type: text/html;charset=UTF-8\n\n"

require "cgi"     # CGI ライブラリの読み込み
form = CGI.new    # formデータを受け取る準備

htmlPrefix = <<-EOS
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
</head>
<body>
EOS

htmlSuffix = <<-EOS
</body>
</html>
EOS

# デバッグ用のエラーメッセージをHTMLで出力する関数
def error_cgi
  puts "<p style=\"color: red\">"
  puts "*** CGI Error List ***<br />"
  puts "#{CGI.escapeHTML($!.inspect)}<br />"
  $@.each do |x|
    print CGI.escapeHTML(x), "<br />\n"
  end
  puts "</p>"
end

begin

  # すべての環境変数を取得
  env = ENV.to_h
  File.open("data/access_log.txt", "a") do |file|
    file.puts "Send: #{ form["message"] }"
    env.each do |key, value|
      file.puts "#{key}: #{value}"
    end
    file.puts "\n"
  end

  # dataフォルダの下のmessage.txtを開いて
  File.open "data/message.txt", 'a' do |f|
      # 受け取ったメッセージを追記
      f.write form["message"]
      # 改行入れる
      f.write "\n"
  end

  puts <<-EOS
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta http-equiv="refresh" content="0;URL='/chat.html'" />
</head>
</html>
EOS


rescue
  error_cgi
end
