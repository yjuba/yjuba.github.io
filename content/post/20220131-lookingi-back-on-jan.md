---
title: "2022年の01月を振り返る"
description: "2022年の01月を振り返る"
date: 2022-01-31T14:18:41Z
draft: false
author: "yjuba"
categories:
  - "振り返り"
---

月に一回の更新を実現するために始めた毎月の振り返り投稿も一年を超えて二年目に突入しました。元々文章を書く量が減っているのを何とかしたいという動機で始めたような気がしていますが、気がつけば仕事では日本語を書くことが支配的になり、逆にプログラムを書くことがなくなってしまいました。次は月に一回でも更新するプログラムを書くべなのかもしれませんが、毎月先月の自分という他人のコードを脳内の読み込む時間となるだけだと思うので現状前向きではありません。

# 仕事関係
12月末で四半期が終わったこともあり、評価周りで文章の作成と調整業務に追われています。油断しているとすぐに期末評価の時期がやってくるのでそれまでにやるべき事をやってしまいたい所です。ここ暫くは採用6割、評価関係2割、その他2割程度の気持ちでやっていましたが、状況的には評価関係を、個人的にはもう少し技術的な所をやりたいという気持ちがあるのでリバランスを進めていく所存です。

# プライベート

## 開発環境
2020年の年末頃にVMWare Workstation Pro上のDebian + GoLandを使う環境からWSL2 + VSCodeに乗り換えましたが続いています。仕事でもプライベートでも同様の構成を取っていたのですが、メインPCの更新に伴いプライベートでは手元のWSL2環境を辞めRemote WSLからRemote SSHへ切り替えました。Remote SSH先は都合のいい機材が無かったので現状Raspberry Pi4の4GBで代用しています。手元のWindowsマシンからリモートのLinuxへgpg-agentの転送をしていますが、セットアップに大層苦労したので忘れる前に記事にまとめます。

Raspberry Pi4の4GBで作業をしていて大きな不満は無いわけですが、ふと思い起こして初めて新品で買って貰ったパソコンに搭載されていたPentium D（正確な型番は怪しい）と比べてみると[PassMarkのスコアで倍以上の差](https://www.cpubenchmark.net/compare/BCM2711-vs-Intel-Pentium-D-805/4297vs1125)がありました。当時そのパソコンでMMOをプレイしていたことを思い起こすと少々の作業では困らないのも道理ですね。

## Blog
自作テーマを暫く使っていましたが、[若干の修正で要望に合うテーマ](https://github.com/LukasJoswiak/etch)を見つけたので切り替えました。大本のテーマの状態だと文章を折り返す幅が狭いと感じたのでそこだけ広げて利用しています。後からコードブロックの部分が好みに合わない事が発覚したので追々そこも対応を入れる予定です。

## FF14
編極編零式の攻略が予定通り二週間で完了しました。スケジュールとしては想定通りの結果となり一安心ですが、少なからずトラブルもあったので次回以降に向けて自分自身振り返るべき所は振り返りたいと思います。6.08になりレンジにも調整が入りましたが、詩人と踊り子で着替える身としては特に憂うことのない結果だったので安心しています。詩人のめんどくさいところはもう少し何とかなると良いのですが。

また、次の10年へ向けた諸々が開示されるPLLが予定されているので期待しています。次の拡張ではそろそろPS4もお役御免でしょうから合わせてPC側の要求スペックが上がるだろうと想像しています。それまでには半導体の供給が安定して欲しい所です。

# 買った物
- ダイニチ HD-RXT521 x 2台

厳密に言えば1台はふるさと納税で返礼品として貰いました。今まで加湿はダイキンの加湿機能付き空気清浄機に任せていたのですが、引っ越して部屋数が増えたのと手入れが面倒なので加湿器は加湿器として独立させました。加湿は迅速で音も静か水も大量に入るので現時点では満足しています。

次はそろそろ水拭きと部屋の形を認識できるロボット掃除機が欲しいと思っています。また、買い物とは別次元ですが、そろそろ真面目に猫を飼うために動き出したいです。