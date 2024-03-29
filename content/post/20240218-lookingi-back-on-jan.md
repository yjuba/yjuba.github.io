---
title: "2024年の01月を振り返る"
description: "2024年の01月を振り返る"
date: 2024-02-18T13:27:57Z
draft: false
author: "yjuba"
categories:
  - "振り返り"
---

油断をしていたら1月の振り返りを終える前に2月が終わりそうになっていました。1月は前半は長めの年末年始休暇でしたが地震もあり世間はバタバタしていたように感じました。

仕事に関しては主務が何か分からない程度には色々なことを進めていますが、トラブルシューティングを通じてLXDやsystemdに少し詳しくなった気がします。

## 1月にやりたかったこと

### 確定申告の準備
確定申告そのものを終わらせました、幸い今年も多少は還付されるようです。もう少しすると固定資産税の支払いが来るので還付されたと思ったらすぐに別の税金として納付するだけなのですが。

### 新NISAへの資産の移管
こちらも無事完了しました。丁度良いタイミングだったので、保有している有価証券の売却と現金比率の調整も実施しました。今まではほぼ全ての資産を有価証券にしていた関係で手元の現金が心許なかったのですが、多少の出費には耐えられる程度の現金を手元に残すことにしました。新NISAについては成長投資枠は年始に一括で、積み立て投資枠については24分割して月に二回ずつ買い付けています。クレカ決済の限度額が十万円になれば一回にまとめてしまうつもりです。早く改正してほしい。

## 2月にやりたいこと

### 読書量を増やす
これと言って思いつかなかったのですが、1月は多少は読みましたが思ったほどではないので2月は少しは増やしたい所です。

## 仕事
冒頭でも少し触れましたが、主務が分からない程度に色々なことを進めています。今はマネージャと言われるような立場ですが、根がインフラエンジニアという職業柄トラブルシューティングや問題解決から学ぶことが多いなと今更ながら思います。

今月は二件ほど記憶に残っている物があるので紹介します。

### 1. 特定条件下でLXDのコンテナがIPアドレスを正常に取得できない
下記の組み合わせでLXDコンテナを起動した際に、ゲストがIPアドレスを取得できないという問題に遭遇しました。

- ホスト: Ubuntu Jammy  (22.04) 
- ゲスト: Ubuntu Xenial (16.04)、CentOS 7

最終的には以下の記事にたどり着き、ホスト側のsystemdが使用しているcgroupのバージョンを2から1にすることで問題が解消しました。詳細までは追っていませんが、ゲストのsystemdが期待しているcgroupのバージョンとホストが使用しているsystemdが使用しているcgroupのバージョンが一致しないことが原因のようです。

[https://discuss.linuxcontainers.org/t/cannot-launch-centos7-images-using-a-jammy-host/15306](https://discuss.linuxcontainers.org/t/cannot-launch-centos7-images-using-a-jammy-host/15306)

当初はXenialのゲストで遭遇した問題でしたが、切り分けのため他のバージョンのUbuntuや他のディストリビューションを試したことで切り分けが進み上記の記事に行き着くことができました。

### 2. systemd管理下のデーモンから起動したコマンドが特権を行使できない
こちらについては担当外の所からお鉢が回ってきた問題となりますが、面白かったので紹介します。

systemd管理下のデーモンから `sudo foo` の様に特権を必要とするコマンドを実行したところ、以下の様なエラーが表示されコマンドの実行に失敗するという問題でした。

```
sudo: The "no new privileges" flag is set, which prevents sudo from running as root.
sudo: If sudo is running in a container, you may need to adjust the container configuration to disable the flag.
```

結論からいうと、 `NoNewPrivileges` を無効化する為に関連する他の設定を変更する必要があるという問題でした。Unitファイルの `NoNewPrivileges` を `false` したにも関わらず、起動後のプロセスは `NoNewPrivs: 1` だったので首を傾げてしまいました。詳細については以下のドキュメントに記載がありますが、特権を取得できると他の制限を課している意味が無くなるため排他的な設定になっていると理解しています。シンプルではありますが極めて有用な設定項目ではあると感じました。

[https://www.freedesktop.org/software/systemd/man/247/systemd.exec.html#Security](https://www.freedesktop.org/software/systemd/man/247/systemd.exec.html#Security)

年を追うごとに、systemd管理下のプロセスにはコンテナの如く様々な制約を課すことができるようになっています。計算資源の割り当てを制限できるのは知っていたのですが、今回の `NoNewPrivileges` をはじめここまで細かい制約を課すことができるようになっていたのは今回の調査を通じて初めて知りました。

## FF14
マンダヴィルウェポンの関係で旧固定のメンバーとエキルレを延々と回しています。仕事の状況は落ち着いていませんが、絶オメガをやるつもりならそろそろ心づもりをするべきだろうと思っています。

## 買った物
- 携帯コインホルダー

何かの配信で見かけて、月に一回程度現金を持ち歩く必要があるので購入しました。普段は紙幣とカードをマネークリップに入れて持ち歩いているのですが、硬貨の取り扱いに困っていたのでとても助かってます。

## 買った本
- 魔法少女リリカルなのはViVid(18) 
- 魔法少女リリカルなのはViVid(19) 
- 魔法少女リリカルなのはViVid(20) 
- 狼は眠らない　（1）
- 狼は眠らない　（2）
- 狼は眠らない　（3）
- ロード・エルメロイII世の冒険 ７ フェムの船宴(中)
- ロード・エルメロイＩＩ世の事件簿　（11）
- 「おかえり、パパ」【電子単行本】　１
- 「おかえり、パパ」【電子単行本】　２
- すごい女の子がかわいいやつ（2,5）
- 女の子がすこぶるかわいいやつ（3）
- 葬送のフリーレン（１）
- 葬送のフリーレン（２）
- 葬送のフリーレン（３）
- 葬送のフリーレン（４）
- 葬送のフリーレン（５）
- 葬送のフリーレン（６）
- 葬送のフリーレン（７）
- 葬送のフリーレン（８）
- 葬送のフリーレン（９）
- 葬送のフリーレン（１０）
- 葬送のフリーレン（１１）
- 葬送のフリーレン（１２）
- 幼女戦記(29)
- サラリーマンが異世界に行ったら四天王になった話 8
- イタリア人の女の子が居候することになった　3
- 敗者のゲーム［原著第８版］

種別を問わず読書量を増やそうということで色々買っています。厳密には一月中には読んでいないのですが、葬送のフリーレンはとても楽しめました。あと、新旧NISAに資産の殆どを突っ込んでいる割には読んだことが無かったので敗者のゲームも読んでいます。色んな動画やブログで述べられている様な事がしつこいくらい繰り返し書かれている良い書籍だと思います。
