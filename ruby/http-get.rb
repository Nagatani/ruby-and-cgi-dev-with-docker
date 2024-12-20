require "net/http"

uri = URI.parse("https://map.yahooapis.jp/search/local/V1/localSearch?appid=dj00aiZpPUlRaTRpZGZxMlZ0QiZzPWNvbnN1bWVyc2VjcmV0Jng9NzM-&query=%E3%83%A9%E3%83%BC%E3%83%A1%E3%83%B3&output=json")
response = Net::HTTP.get_response(uri)

puts "code : ", response.code # status code
puts "body : ", response.body # response body