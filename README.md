# sort_by_key

## English Version

PR is welcome!

## Japanese Version

`Localizable.strings` のようなキーとバリューが `=` で繋がれているファイルを並び替えるコマンドです。

- 並び順はテンプレート・ファイルに記述したキーの順番になります。
- テンプレート・ファイルにないデータは末尾に表示されます


### 使い方 ###

```
$ sort_by_key.rb TEMPLATE.txt DATA.txt
```

### データ・ファイル ###

データ・ファイルはキーとバリューを `=` で繋いだファイルです。並びはどんな順番でも構いません。

```c
"Donut" = "ドーナツ"
"Froyo" = "フローズンヨーグルト"
"Eclair" = "エクレア"
"KitKat" = "キットカット"
```

### テンプレート・ファイル ###

テンプレート・ファイルはデータ・ファイルのキーだけを書き出します。

- キーは `"` で始まります
- `"` で始まらない場合はコメントとして解釈されます

```c
/* 名式非公式 */
"Apple Pie"
"Banana Bread"
/* No Key */
```

## 使用例 ##

```
$ ./sort_by_key.rb template.txt sample.txt
/* 名式非公式 */
"Apple Pie" = "アップルバイ"
"Banana Bread" = "バナナブレッド"
/* 1.X 系 */
"Cupcake" = "カップケーキ"
"Donut" = "ドーナツ"
/* 2.X 系 */
"Eclair" = "エクレア"
"Froyo" = "フローズンヨーグルト"
"Gingerbread" = "ジンジャーブレッド"
/* 3.X 系 */
"Honeycomb" = "ハニカム"
/* 4.X 系 */
"Ice Cream Sandwich" = "アイスクリームサンドウィッチ"
"Jelly Bean" = "ジェリービーン"
"KitKat" = "キットカット"
/* 5.X 系 */
"Lollipop" = "ロリポップ"
/* 6.X 系 */
"Marshmallow" = "マシュマロ"
/* No Key */
"Original Sample Food" = "オリジナル・サンプル・フード"
```
