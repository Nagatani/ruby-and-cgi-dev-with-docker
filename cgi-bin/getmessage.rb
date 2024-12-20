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

begin
  puts"<meta charset='UTF-8'>"
  puts form["message"]
rescue
  error_cgi
end
