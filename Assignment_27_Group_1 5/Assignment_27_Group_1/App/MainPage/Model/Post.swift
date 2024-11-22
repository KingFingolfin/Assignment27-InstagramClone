//
//  Post.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//
import Foundation

struct PostModel: Codable {
    let attribution: String?
    let caption: Caption
    let comments: CommentData
    let createdTime: String
    let filter: String
    let id: String
    let images: ImageData
    let likes: LikeData
    let link: String
    let location: Location
    let tags: [String]
    let type: String
    let user: User
    let userHasLiked: Bool
    let usersInPhoto: [UserInPhoto]
    let videos: VideoData

    struct Caption: Codable {
        let createdTime: String
        let from: User
        let id: String
        let text: String
    }

    struct CommentData: Codable {
        let count: Int
        let data: [Comment]

        struct Comment: Codable {
            let createdTime: String
            let from: User
            let text: String
        }
    }

    struct LikeData: Codable {
        let count: Int
        let data: [User]
    }

    struct ImageData: Codable {
        let lowResolution: ImageSize
        let standardResolution: ImageSize
        let thumbnail: ImageSize

        struct ImageSize: Codable {
            let height: Int
            let url: String
            let width: Int
        }
    }

    struct Location: Codable {
        let id: String
        let latitude: Double
        let longitude: Double
        let name: String
    }

    struct User: Codable {
        let fullName: String
        let id: String
        let profilePicture: String
        let username: String
    }

    struct UserInPhoto: Codable {
        let position: Position
        let user: User

        struct Position: Codable {
            let x: Double
            let y: Double
        }
    }

    struct VideoData: Codable {
        let lowResolution: VideoSize
        let standardResolution: VideoSize

        struct VideoSize: Codable {
            let height: Int
            let url: String
            let width: Int
        }
    }

    enum CodingKeys: String, CodingKey {
        case attribution
        case caption
        case comments
        case createdTime = "created_time"
        case filter
        case id
        case images
        case likes
        case link
        case location
        case tags
        case type
        case user
        case userHasLiked = "user_has_liked"
        case usersInPhoto = "users_in_photo"
        case videos
    }
}
