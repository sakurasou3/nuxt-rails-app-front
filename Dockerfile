FROM node:20.11.1-alpine

ARG WORKDIR
# ARG CONTAINER_PORT

# LANG=C.UTF-8 ... コンピュータ用の英語(not en-US)を、文字コードUTF-8で利用する
# HOST-0.0.0.0 ... Nuxt.jsのデフォルトでは外部(ホストPCのブラウザ)からアクセスができない。0.0.0.0を指定して初めてアクセス可能になる
# https://v2.nuxt.com/ja/docs/features/configuration#%E3%83%9B%E3%82%B9%E3%83%88%E3%81%A8%E3%83%9D%E3%83%BC%E3%83%88%E7%95%AA%E5%8F%B7%E3%82%92%E7%B7%A8%E9%9B%86%E3%81%99%E3%82%8B
ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR ${HOME}

# 公開用ポート番号を指定
# アクセスするURLは以下のようになる。
# http://localhost(0.0.0.0):3000
# EXPOSEを残していてもいいが、Nuxt.jsのデフォルトポートが3000なのでコメントアウト
# EXPOSE ${CONTAINER_PORT}

# 2021.12.13追記
# FROM node:14.15.1-alpine
# node v14.15.1は、$ yarn create nuxt-app appコマンド時に下記エラーが発生するので使用不可
# eslint-plugin-vue@8.2.0: The engine "node" is incompatible with this module. Expected version "^12.22.0 || ^14.17.0 || >=16.0.0". Got "14.15.1"

# create nuxt-appコマンド成功確認済みのnode version
# FROM node:16.13.1-alpine
# or
# FROM node:16-alpine(node v16.13.1)

# 現在のnode推奨版はこちらから => https://nodejs.org/ja/download/