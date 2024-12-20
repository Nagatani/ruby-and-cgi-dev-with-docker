require "socket"

server = TCPServer.new 20000
loop do
  Thread.start(server.accept) do |client|
    # Thread Debug
    p [Thread.current]

    # リクエストデータの分割
    headers = []
    while header = client.gets
      break if header.chomp.empty?
      headers << header.chomp
    end
    # Header Debug
    p [Thread.current, headers]

    # リクエストヘッダの１行目から、リクエストパスを取得
    request_lines = headers[0].split(" ")
    path = request_lines[1]
    # Debug
    p path

    # リクエストパスに応じて、レスポンスデータを生成
    response_filename = ""
    response_contentType = ""
    if path == "/" then
      response_filename = "index.html"
    else
      response_filename = path
      response_filename[0] = ''
    end

    if path == "/" ||
      path.end_with?(".html") then
      response_contentType = "Content-Type: text/html"
    elsif path.end_with?(".css") then
      response_contentType = "Content-Type: text/css"
    elsif path.end_with?(".js") then
      response_contentType = "Content-Type: text/javascript"
    else
      response_contentType = "Content-Type: text/plain"
    end

    # レスポンスヘッダの出力
    client.puts "HTTP/1.0 200 OK"
    client.puts response_contentType
    client.puts

    # レスポンスボディをファイルから読み込んで出力
    s = []
    File.foreach("www/" + response_filename){|line|
      s << line.chomp
    }
    client.puts s
    client.close

  end
end
