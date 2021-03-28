---
title: "自作のテーマに乗り換えた"
description: "自作のテーマに乗り換えた"
date: 2021-03-28T15:28:43+09:00
draft: false
author: "yjuba"
categories:
  - "技術"
---

タイトルの通りですが、今まで使っていた[even](https://github.com/olOwOlo/hugo-theme-even)から[自作のテーマ](https://github.com/yjuba/hugo-theme-my-blog)に乗り換えました。

久々にHTMLとCSSを書くこととなり大層苦労しましたが、一旦自分の満足する形に仕上がりました。
トップページは箇条書きで記事の一覧を出したい、基本的な見た目はGitHub風な見た目にしたいと以前から考えていましたが、このあたりの領域は苦手な上、余所様のデザインやCSSを借りてくるのはライセンスや倫理的に如何な物かと思い躊躇っていました。

一方、他の方の自作テーマを見ているときに、[normalize.css](https://necolas.github.io/normalize.css/)の存在を知り、多少自分でも頑張ればそれっぽくなるかなと腰を上げて調べたところ、GitHub社がそのものズバリな[primer.css](https://primer.style/css/)を公開していることを知ったので、primer.cssをベースにしたテーマを自作しました。

テーマの自作にあたっては、以下のページが大変参考となりました、ありがとうございます。

- https://blog.unresolved.xyz/how-to-make-of-hugo-theme

上記のページを足がかりに、Hugo公式が提供している[ドキュメント](https://gohugo.io/templates/)や[サンプルリポジトリ](https://github.com/gohugoio/hugoBasicExample)と2日ほど格闘した結果、それっぽい見た目になったので一旦満足しています。
まだ、変更を加えたい部分もあるので、それは追々やっていこうと思います。
