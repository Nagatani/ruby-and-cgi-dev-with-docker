require "socket" # ソケット通信のライブラリ

# TCPServerはsocketライブラリのなかにある
# TCPServerを自分のマシン:localhostの12345番で開く -> serverに代入
server = TCPServer.open("0.0.0.0", 12345)
loop do # 無限ループ

    # マルチスレッド処理にserverに接続してきた(accept)クライアントの処理を渡す
    Thread.start(server.accept) do |client|
        client.puts("hello, Client!!")
        client.close
    end
end