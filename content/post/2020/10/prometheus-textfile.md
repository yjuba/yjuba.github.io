---
title: "client_golangを使ってPrometheusのtext formatに即したファイルを生成する"
description: "client_golangを使ってPrometheusのtext formatに即したファイルを生成する"
date: 2020-10-31T17:00:02+09:00
draft: false
author: "yjuba"
categories:
  - "技術"
---

以下のツイートをして早二月が経過しようとしていたので、慌ててBlogを起こしている。
先月は時間に余裕があったので勝手に達成していたが、
今月はFF14のパッチ5.35が来たり仕事が忙しくて危うく10月が終わるところだった。殆どボズヤに籠もりっぱなしである。
{{< tweet 1301175780366458880 >}}

以下本題。

仕事で時折PrometheusのExporerを自作していたが、あまり乱立させるのもどうかと思い、node exporterのtextfile collectorを通して提供する形に変更する検証を行っていた。
その際に、先行事例を調べたが、すぐ見つかる範囲ではシェルスクリプトやワンライナーを定期実行している事例が多く、[client_golang](https://pkg.go.dev/github.com/prometheus/client_golang/prometheus)を使った事例をあまり見かけなかったので簡単に記載する。

まず、大枠としては[WriteToTextfile](https://pkg.go.dev/github.com/prometheus/client_golang/prometheus#WriteToTextfile)を利用すれば良い。
ドキュメントにも記載があるとおり、一時ファイルに書き込んだ後リネームするため細かいことを心配する必要も無い。

個人的に少し引っかかったのは、第二引数の[Gatherer](https://pkg.go.dev/github.com/prometheus/client_golang/prometheus#Gatherer)で返却する[dto.MetricFamily](https://pkg.go.dev/github.com/prometheus/client_model/go#MetricFamily)だった。

MetricFamilyを生成するための関数も無く、どのような形で生成するのがいいか迷っていたが、テストコード中でMetricFamilyを生成している箇所を発見して事なきを得た。

[https://github.com/prometheus/client_golang/blob/v1.8.0/prometheus/registry_test.go#L73-L94](https://github.com/prometheus/client_golang/blob/v1.8.0/prometheus/registry_test.go#L73-L94)

元がprotoファイルから生成されたモデルなので、[proto.String](https://pkg.go.dev/github.com/golang/protobuf/proto#String)等を利用すれば良いらしい。
せめて、ドキュメントのどこかに一言くらい言及があると嬉しかったかも知れない。

textfile collectorへの置き換え自体は完了していないので、今は掲載するコードがないが、終わった暁にはサンプルも掲載したい。（単に10月が終わりそうで間に合わないというのも大きいが･･･）
