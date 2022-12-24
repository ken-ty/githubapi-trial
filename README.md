# githubapi-trial
Trial to create GitHub REST API used source code from ChatGPT.


[ChatGPT](https://chat.openai.com/chat) にて githubAPIの使い方を出力し, 微調整して使えるようにした。

## 質問
swift で github にログインして, リポジトリ一覧を取得するコードを書いてください.

## 回答

GitHub APIを使用することで, リポジトリ一覧を取得することができます. 以下に, GitHub APIを使用してリポジトリ一覧を取得するSwiftコードを示します:

```
import Foundation

struct Repository: Decodable {
  let name: String
  let description: String
}

func getRepositories(username: String, completion: @escaping ([Repository]) -> Void) {
  let url = URL(string: "https://api.github.com/users/\(username)/repos")!
  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let error = error {
      print(error)
      return
    }

    guard let data = data else {
      print("No data")
      return
    }

    do {
      let decoder = JSONDecoder()
      let repositories = try decoder.decode([Repository].self, from: data)
      completion(repositories)
    } catch {
      print(error)
    }
  }
  task.resume()
}

getRepositories(username: "USERNAME") { repositories in
  for repository in repositories {
    print(repository.name)
  }
}
```

上記のコードでは, getRepositories関数を使用して, 指定したユーザー名のリポジトリ一覧を取得しています. リポジトリ情報は Repository 構造体で表され, 名前(name)と説明(description)がフィールドとして定義されています. getRepositories関数は, ユーザー名を引数として受け取り, completion という名前のクロージャを返すように定義されています. クロージャは, リポジトリ一覧を取得した後に実行される処理を記述することができます.

注意: 上記のコードでは, USERNAMEの部分には実際のユーザー名を設定する必要があります.また, GitHub APIにはアクセス制限があるため, アクセスする回数に制限があることに注意してください.

## 手直し

手直しした箇所は changed とコメントした.