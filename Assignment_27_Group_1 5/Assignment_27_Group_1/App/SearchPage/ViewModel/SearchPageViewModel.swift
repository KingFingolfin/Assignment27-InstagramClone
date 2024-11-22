//
//  SearchPageViewModel.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import Foundation

class SearchPageViewModel {
    private var imagePosts = [ImagePost]()
    
    func fetchImagePosts() {
        imagePosts = [
            ImagePost(imageURL: "image1"),
            ImagePost(imageURL: "image2"),
        ]
    }
    
    func getImagePosts() -> [ImagePost] {
        return imagePosts
    }
}
