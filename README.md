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
