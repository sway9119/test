# モダン JavaScript の機能に触れる

## 2-1 const、let での変数宣言

let: 上書きしていくような変数の場合は let を使用する。
const: 基本的には変数の上書きも再宣言も不可能。だが、const で定義していてもオブジェクトの中身は自由に変更できる。
→ 文字列や数値等のプリミティブ型はデータは const で定義した場合、上書き不可能
→ オブジェクトや配列などのオブジェクト型は const で定義しても中身を変更できる。

## テンプレート文字列

```js
const name = "鈴木";
const message = `私の名前は${name}です。`;
```

→ `バッククオートで文字列を囲み、${} で囲むと変数を展開できる。

## アロー関数

```js
// 従来の関数1
function func1(value) {
  return value;
}

// 従来の関数2
const func1 = function (value) {
  return value;
};

// アロー関数
const func2 = (value) => {
  return value;
};
// 引数が一つの場合は（）を省略可能。
// 処理を単一行で返却する場合は波括カッコとreturnを省略できる。
// 複数行でも{}で囲むと単一行のようにまとめて返却できる。
const func5 = (val1, val2) => ({
  name: val1,
  age: val2,
});
```

## 2-4 分割代入

```js
// 分割ファイルを使用しないで文字列を出力
const myProfile = {
  name: "鈴木",
  age: 24,
};
const message = `私の名前は${myProfile}です。年齢は${myProfile.age}です。`;

// 分割代入を使用する
const myProfile = {
  name: "鈴木",
  age: 24,
};

// オブジェクトの分割代入
const { name, age } = myProfile;
const message = `私の名前は${myProfile}です。年齢は${myProfile.age}です。`;

// 配列のインデックスを指定して代入を行う
const myProfile = ["鈴木", 24];
const message = `私の名前は${myProfile[0]}です。年齢は${myProfile[1]です。}`

// 配列に対して分割代入を行う
const myProfile = ['鈴木', 24];
const [name, age] = myProfile;
const  message = `私の名前は${name}です。年齢は${age}です。
```

## 2-6 スプレッド構文

```js
const arr1 = [1, 2];
console.log(arr1); // [1,2]
console.log(...arr1); // 1 2
```

## 2-7 オブジェクトの省略記法

```js
// プロパティ名と変数名が同一の場合
const name = "鈴木";
const age = 24;

const user = {
  name: name,
  age: age,
};

// 省略し書き方
const user = {
  name,
  age,
};
```

## 2-8 map、 filter

```js
// map
// 配列を定義
const nameArr = ["鈴木", "田中", "高橋"];
// 引数(name)に配列の値が設定される。returnで返却する。
const nameArr2 = nameArr.map((name) => {
  return name;
});
```

```js
// filter
// 配列を定義
const numArr = [1, 2, 3, 4, 5];

// 奇数(2で割った余が1)のみ抽出
const newNumArr = numArr.filter((num) => {
  return num % 2 === 1;
});

console.log(newNumArr); // [1, 3, 5]
```
