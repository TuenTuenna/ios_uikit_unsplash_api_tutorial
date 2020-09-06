//
//  Photo.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/09/06.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation

struct Photo : Codable {
    var thumbnail : String
    var username : String
    var likesCount : Int
    var createdAt : String
}
