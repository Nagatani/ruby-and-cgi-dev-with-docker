#!/usr/bin/env ruby
# coding: UTF-8

require "cgi"     # CGI ライブラリの読み込み
form = CGI.new    # formデータを受け取る準備

puts "Content-Type: application/json; charset=utf-8"
puts ""

name = form["name"]
arr = ["犬", "猫", "ネズミ"]
lucky = "クジラ"
if name != nil && name != "" then
    index = name.length % arr.length
    lucky = arr[index]
end
json = "{\"lucky\":\"#{ lucky }\", \"name\":\"#{ name }\"}"

callback=form["callback"]
if callback != nil && callback != "" then
    json = "#{ callback }(#{ json });"
end

puts json