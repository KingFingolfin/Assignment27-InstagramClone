//
//  MainPageViewModel.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import Foundation

class MainPageViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    private let networkManager: NetworkProtocol = NetworkingManager()

    func fetchPosts() {
        let urlString = "http://localhost:3000/v1/geographies/:geo-idmedia/recent"

        networkManager.fetchData(from: urlString, responseType: [PostModel].self) { [weak self] result in
            switch result {
            case .success(let posts):
                self?.posts = posts
                print("Successfully fetched \(posts.count) posts")
            case .failure(let error):
                print("Error fetching posts: \(error.localizedDescription)")
            }
        }

    }
    
    func numberOfItems() -> Int {
        return posts.count
    }
}
