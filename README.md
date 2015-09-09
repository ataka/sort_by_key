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
"about emacs" = "この Emacs について"
"close" = "閉じる"
"copy" = "コピー"
"cut" = "切り取り"
```

### テンプレート・ファイル ###

テンプレート・ファイルはデータ・ファイルのキーだけを書き出します。

- キーは `"` で始まります
- `"` で始まらない場合はコメントとして解釈されます

```c
/* Menu */
"emacs"
"file"
"edit"
"options"
"tools"
"help"

/* Menu - Emacs */
"about emacs"
"preferences"
"quit emacs"
```

## 使用例 ##

```
$ ./sort_by_key.rb template.txt sample.txt
/* Menu */
"emacs" = "Emacs"
"file" = "ファイル"
"edit" = "編集"
"options" = "オプション"
"tools" = "ツール"
"help" = "ヘルプ"

/* Menu - Emacs */
"about emacs" = "この Emacs について"
"preferences" = "設定"
"quit emacs" = "Emacs を終了する"

/* Menu - File */
"visit new file" = "新しいファイルを開く"
"open directory" = "ディレクトリーを開く"
"close" = "閉じる"

/* Menu - Edit */
"undo" = "アンドゥ"
"cut" = "切り取り"
"copy" = "コピー"
"paste" = "貼り付け"

/* New keies */
"unknown" = "Unknown New Key"
```
