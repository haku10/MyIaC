# MyIaC
TerraForm for AWS

# 事前準備
AWSにアカウントを作成しておくこと
※ wikiに記載予定

AWSのクレデンシャル情報を所定の場所に配備
例) `/Users/ユーザー名/.aws` (Mac)

direnvの環境設定によりディレクトリがカレントになった時だけ環境変数を有効にする
参考記事
`https://qiita.com/kompiro/items/5fc46089247a56243a62`

`brew install direnv`

`.envrc`に下記を追記
```
export AWS_PROFILE=XXX
export AWS_REGION=ap-northeast-1
```
`~/.aws/credentials`の`[default]`を`[XXX]`に修正
```
※[XXX]は任意の名称
aws_access_key_id = {your_access?key}
aws_secret_access_key = {your_secret_access_key}
```
`direnv allow`

# terraformのインストール(for Mac)
`$ brew install terraform`
`$ terraform version`

`aws configure --profile XXX`

`terraform init`

# 設定されるサービスを事前に確認する
`terraform plan`

# 確認ができたら作成する
``

# 作成したサービスを削除する
`terraform destroy`
