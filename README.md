# 学習用リポジトリ

http://devtesting.jp/tddbc/?TDDBC%E5%A4%A7%E9%98%AA2.0%2F%E8%AA%B2%E9%A1%8C

## 軽い説明

自動販売機の動きをシミュレートしていく学習教材です。
例えば自動販売機クラスを作り、10 円投入をプログラミングで抽象的に表して回答とします。
参考とする用語集
http://devtesting.jp/tddbc/?TDDBC%E4%BB%99%E5%8F%B002%2F%E8%AA%B2%E9%A1%8C%E7%94%A8%E8%AA%9E%E9%9B%86

例えば VendingMachine クラスを作り

```
vm = VendingMachine.new

vm.total # => 0と出力される
# 100円を投入
vm.insert("10 yen coin")

vm.total # => 10と出力される
```

のような感じでプログラミングし、「API はこういう使い方のほうが使いやすそう」とか議論するのが目的です。
