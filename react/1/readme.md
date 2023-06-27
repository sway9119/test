# React を始める前に知っておきたいモダン JavaScript の基礎

## 1-2 DOM、仮想 DOM

Document Object Model
仮想 DOM とは、変更箇所のみを実装の DOM に反映することで DOM への操作を最小限に抑えることが可能になる
React や Vue などのモダン JavaScript のフレームワークやライブラリでは仮想 DOM が用いられる。
レンダリングコストを最小限におさせて快適な Web システムを提供することが可能となる。

## 1-3 npm

パッケージマネージャー NPM というパッケージの公開場所のレジストリがある。
$ npm install [パッケージ名] // インストールするコマンド
$ yarn add [パッケージ名]
→ node_modules というフォルダが生成され、その中にパッケージの実態が展開される。

## 1-6 SPA と従来の Web システムの違い

Single Page Application: JavaScript で画面を書き換えることで画面遷移などの動きを表現する。
画面の各要素をコンポーネントとして定義し、使い回す。
