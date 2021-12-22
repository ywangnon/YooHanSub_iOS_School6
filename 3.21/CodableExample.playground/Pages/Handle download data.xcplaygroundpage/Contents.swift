//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//: - - -
//: # Handle download data
//: - - -


// "https://api.github.com/search/repositories?q=language:swift+user:giftbott"
// Q. API Response 에서 Repository 의 fullName, description, startCount, forkCount, url 을 뽑아볼 것


struct Repositories: Decodable {
  let items: [Repository]

  enum CodingKeys: String, CodingKey {
    case items
  }

  struct Repository: Decodable {
    let fullName: String
    let description: String?
    let starCount: Int
    let forkCount: Int
    let url: String

    enum CodingKeys: String, CodingKey {
      case fullName = "full_name"
      case description = "description"
      case starCount = "stargazers_count"
      case forkCount = "forks_count"
      case url = "html_url"
    }
    //init을 생성할 때는 디코딩인포프레젠트를 해준다. 기본으로 자동적으로 생성된다.
  }
}

func fetchGitHubRepositories() {
  let url  = URL(string: "https://api.github.com/search/repositories?q=language:swift+user:giftbott")!

  let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let response = response as? HTTPURLResponse, let data = data else { return }
    guard 200..<400 ~= response.statusCode else { return }
    do {
      let repositories = try JSONDecoder().decode(Repositories.self, from: data)
      for repository in repositories.items {
        print(repository.fullName)
        print(repository.description ?? "")
        print(repository.starCount)
        print("\n= = = = = = = = = = = = = = =\n")
      }
    } catch {
      print(error.localizedDescription)
    }
  }
  dataTask.resume()
}

fetchGitHubRepositories()

//: [Next](@next)
