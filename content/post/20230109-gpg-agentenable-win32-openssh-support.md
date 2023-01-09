---
title: "gpg-agentがWin32-OpenSSHのエミュレーションをサポートした"
description: "gpg-agentがWin32-OpenSSHのエミュレーションをサポートした"
date: 2023-01-09T14:32:07Z
draft: false
author: "yjuba"
categories:
  - "技術"
---

## 前提
日常的にYubiKeyに入れたPGP鍵（認証鍵）を使ってsshしているのですが、GnuPGの変更によって構成が変化したため以下にまとめます。鍵はsshにおける公開鍵認証とgitのコミットへの署名に利用しています。なお、ホストのOSにはWindows10を使用しており、実際の開発や作業はWSL2もしくは仮想マシン上のLinuxで行っています。

当初はgpg-agentをgpg-agentとして利用していました。その際には[win-gpg-agent](https://github.com/rupor-github/win-gpg-agent)を使用して各種の問題を回避していました。ところが、2022年の9月にサポートが終了したため乗り換え先を探していました。

## 本文
GnuPGのバージョン2.4.0において、gpg-agentが[Win32-OpenSSH](https://github.com/PowerShell/Win32-OpenSSH)のエミュレーションをサポートしました。コミットは以下のURLになります。

https://dev.gnupg.org/rGc51139f2bc546c6bd4548e24a604f2178a2b8366

`enable-win32-openssh-support` のオプションを伴って起動されたgpg-agentは `\\.\pipe\openssh-ssh-agent` という名前付きパイプを生成します。Win32-OpenSSHは名前付きパイプを経由してgpg-agentとSSH Agent Protocolでやりとりをすることができます。（補足: 「SSH Agent Proocolでやりとりする」と記載したとおり、このときgpg-agentはssh-agentとして振る舞います。）

これによって、現在の私の環境は以下の図のようになりました。

![構成図](/enable-win32-openssh-support.png)

YubiKeyに入っている認証鍵をgpg-agent経由で利用する形となっています。また、認証鍵を利用する際にはYubiKeyへのタッチが必要となるように設定しています。これは、agent forwardingを利用した際に、転送先のホスト上で意図しない鍵の利用を防ぐ為にこのように設定しています。

また、WSL2上でも同様に鍵を扱いたかったため、npiperelayとsocatを利用して名前付きパイプへの疎通を確保しています。本当はこのワークアラウンドも避けたいのですが、現状回避方法を発見できなかったためこのようにしています。

ちなみに、元々は[知人の投稿](https://keens.github.io/blog/2021/03/23/yubikeywotsukau_openpghen/)に惹かれてYubiKeyにPGP鍵を入れて運用を始めたのですが、結果としてPGP鍵はSSH鍵として利用されることとなってしまいました。本当ははssh-agentとしてではなく、gpg-agentをgpg-agentとして運用したいのですが、一旦は運用のやりやすさを優先して現状の構成としています。

## 補足
なぜ、こんなに面倒なことになっているのかと思われるかも知れませんが、Windowsにおけるssh-agent事情は混沌を極めているという前提があります。詳細は以下のURLにまとめられています。

https://qiita.com/slotport/items/e1d5a5dbd3aa7c6a2a24

