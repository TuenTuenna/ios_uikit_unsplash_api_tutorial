//
//  Constants.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/08/21.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation

enum SEGUE_ID {
    static let USER_LIST_VC = "goToUserListVC"
    static let PHOTO_COLLECTION_VC = "goToPhotoCollectionVC"
}

enum API {
    
    static let BASE_URL : String = "https://api.unsplash.com/"
    
    // 요건 여러분 꺼로 하셔야 됩니다!! 😅
    static let CLIENT_ID : String = "JOvX6IMkB3JjvXu2J7eWYsoSmwy33IGvlhTBneG1rLk"
    
}

enum NOTIFICATION {
    enum API {
        static let AUTH_FAIL = "authentication_fail"
    }
}
