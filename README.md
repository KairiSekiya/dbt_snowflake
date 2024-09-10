# dbt_snowflake

## dbtのインストール
- 「python3 -m pip install dbt-core dbt-snowflake」
  - エラー。「error: externally-managed-environment」
- 「python3 --version」
  - Python 3.12.6
- 「pyenv versions」
  - * 3.9.6、反映していない
- 以下のコマンドを実行
  - export PATH="$HOME/.pyenv/bin:$PATH"
  - eval "$(pyenv init --path)"
  - eval "$(pyenv init -)"
  - eval "$(pyenv virtualenv-init -)"
  - source ~/.zshrc
    - command not found: compdef
- 「command not found: compdef」に対応する対応
  - autoload -Uz compinit
  - compinit
  - source ~/.zshrc
  - 「python3 --version」
  - Python 3.9.6
- 再度実行「python3 -m pip install dbt-core dbt-snowflake」
  - エラーは発生しない
- 「dbt --version」
  - snowflakeの文字がなかった
- 「pip3 show dbt-snowflake」
  - Location: /Users/kairi/.pyenv/versions/3.9.6/lib/python3.9/site-packages
- 「~/.zprofile」に以下を追加
  - export PATH= /Users/kairi/.pyenv/versions/3.9.6/bin:$PATH
- 「source ~/.zprofile」
- 「dbt --version」

## 環境設定
- Astro プロジェクトを作成
  - 「astro dev init」
- dbtディレクトリの作成
  - 「mkdir dbt && cd dbt」
- dbtディレクトリ内でdbt プロジェクトを作成
  - 「dbt init」
    - Which database would you like to use?
      - 「1」だとsnowflake
    - その他もろもろ設定

## dbtに関する操作
- dbt/cosmosproject内にpackages.ymlを作成
  - packages.yml に追加した「dbt-labs/dbt_utils」をインストールする
  - dbt/cosmosproject内に「dbt deps」コマンドを実行
- dbt/dbt_project.yml
