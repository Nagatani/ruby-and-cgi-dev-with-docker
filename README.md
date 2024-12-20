# ruby-and-cgi-dev-with-docker
講義で使用する環境をひとまとめにしたやつ

## usage

```bash
$ docker compose build
$ docker compose up -d
# ruby環境へのbash
docker compose exec ruby /bin/bash
# ruby-cgi環境へのbash
docker compose exec ruby-cgi /bin/bash
```