//
//  LikesPageViewModel.swift
//  Assignment_27_Group_1
//
//  Created by Nino Kurshavishvili on 22.11.24.
//

import Foundation

class LikesPageViewModel {
    private var actions = [LikeAction]()
    
    func fetchLikeActions() {
        actions = [
            LikeAction(username: "karenne", actionText: "liked your photo.", time: "1h", profileImageURL: "profile1", isFollowing: false),
            LikeAction(username: "martini_rond", actionText: "started following you.", time: "3d", profileImageURL: "profile2", isFollowing: true),
        ]
    }
    
    func getActions() -> [LikeAction] {
        return actions
    }
}
