import Foundation

/// 動作テスト
public class Main {
    public init() {
//        let username = "USERNAME"
        let username = "ken-ty"
        getRepositories(username: username) { repositories in
            for repository in repositories {
                print(repository.name)
                // changed ↓
                if repository.description != nil {
                    print(repository.description!)
                } else {
                    print("description is nothing")
                }
                // changed ↑
                print()
            }
        }
    }
}
