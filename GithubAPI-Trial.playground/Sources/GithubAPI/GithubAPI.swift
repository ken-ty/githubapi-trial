import Foundation

struct Repository: Decodable {
  let name: String
  let description: String? // changed
}

func getRepositories(username: String, completion: @escaping ([Repository]) -> Void) {
  let url = URL(string: "https://api.github.com/users/\(username)/repos")!
  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let error = error {
        print(error)
        print("getRepositories error")
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
        // changed ↓
        do {
            let items = try JSONSerialization.jsonObject(with: data) as! Dictionary<String, Any>
            print("decoder error data")
            print(items)
        } catch {
            print("decoder anything error")
        }
        // changed ↑
      print(error)
    }
  }
  task.resume()
}
