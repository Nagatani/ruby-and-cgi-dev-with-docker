#!/usr/bin/env ruby
# coding: UTF-8

print "content-type: text/html\n\n"

require "cgi"     # CGI ライブラリの読み込み
form = CGI.new    # formデータを受け取る準備

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

htmlPrefix = <<-EOS
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Chat</title>
</head>
<body>
EOS

htmlSuffix = <<-EOS
</body>
</html>
EOS

begin
  # HTMLの基本的なヘッダを出力
  puts htmlPrefix

  s = File.read("data/message.txt", :encoding => Encoding::UTF_8) 
  puts "<pre>" + s + "</pre>"
  
  # HTMLの末尾を出力
  puts htmlSuffix

rescue
  error_cgi
end
