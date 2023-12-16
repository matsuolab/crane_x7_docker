# 使用方法
## イメージのビルド 

1. 環境変数を使う場合
```
$ export CRANEX_PROJECT_NAME=hoge
$ ./BUILD-DOCKER-IMAGE.sh
```

1. プロジェクト名を直接指定する場合
```
$ ./BUILD-DOCKER-IMAGE.sh hoge
```


## コンテナの起動

1. 環境変数を使う場合
```
$ export CRANEX_PROJECT_NAME=hoge
$ ./RUN-DOCKER-IMAGE.sh
```

1. プロジェクト名を直接指定する場合
```
$ ./RUN-DOCKER-IMAGE.sh hoge
```

## サンプルプログラムを動かす

[ここ](https://github.com/rt-net/crane_x7_ros/blob/master/crane_x7_examples/README.md)にサンプルプログラムの動かし方が載っている

## その他
[crane-X7の制御用パッケージ](https://github.com/rt-net/crane_x7_ros/tree/master/crane_x7_examples)