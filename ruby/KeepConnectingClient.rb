require "socket"

begin
  server = TCPSocket.open("localhost", 20000)

  # サーバーからのメッセージ受信をスレッドにして常に受信をし続ける
  serverGet = Thread.new do
    while message = server.gets
      puts message
    end
  end

  # キーボードからの入力を待ちサーバーへ送信
  while input = $stdin.gets
    server.print input
  end

  # 接続を終了
  server.close

  # サーバーからの受信スレッド終了を待つ
  serverGet.join

ensure
  server.close if server
end
