require "socket"
server = TCPServer.new(20000)
loop do
  Thread.start(server.accept) do |client|

    # 初回クライアントに伝えるメッセージ
    client.puts "サーバーに接続されました。"

    loop do

      line = client.gets
      # p line
      break if line == nil # 送られてきたメッセージがnilだったらループ終わり

      # 改行を取り除くのと、文字コードをUTF8に強制変更
      line = line.chomp.force_encoding("utf-8")
      
      # サーバー側に出力
      puts "受信: #{line}"
      # 受信したメッセージに対する何らかの処理を実装する

      ret = line
      if (line.start_with?("こんにちわ")) then
        ret = "こんにちは！日本語は正しく使えるとよいですね！"
      end

      # サンプルで、受け取ったメッセージをそのまま出力
      # ret = line
      client.puts "サーバーからの応答: #{ret}"

    end
  end
end
