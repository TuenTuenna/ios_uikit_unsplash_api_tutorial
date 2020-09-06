//
//  MyAlamofireManager.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/08/27.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class MyAlamofireManager {
        
    // 싱글턴 적용
    static let shared = MyAlamofireManager()
    
    // 인터셉터
    let interceptors = Interceptor(interceptors:
                        [
                            BaseInterceptor()
                        ])
    // 로거 설정
    let monitors = [MyLogger(), MyApiStatusLogger()] as [EventMonitor]
    
    // 세션 설정
    var session : Session
    
    private init() {
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors
        )
    }
    
    
    func getPhotos(searchTerm userInput: String,
                   completion: @escaping (Result<[Photo], MyError>) -> Void){
        
        print("MyAlamofireManager - getPhotos() called userInput : \(userInput)")
        
        self.session
            .request(MySearchRouter.searchPhotos(term: userInput))
            .validate(statusCode: 200..<401)
            .responseJSON(completionHandler: { response in
            
                guard let responseValue = response.value else { return }
                
                let responseJson = JSON(responseValue)
                
                let jsonArray = responseJson["results"]
                
                var photos = [Photo]()
                
                print("jsonArray.count : \(jsonArray.count)")
                
                for (index, subJson): (String, JSON) in jsonArray {
                    print("index: \(index) , subJson : \(subJson)")
                    // 데이터 파싱
//                    let thumbnail = subJson["urls"]["thumb"].string ?? ""
//                    let username = subJson["user"]["username"].string ?? ""
//                    let likesCount = subJson["likes"].intValue ?? 0
//                    let createdAt = subJson["created_at"].string ?? ""
                    guard let thumbnail = subJson["urls"]["thumb"].string,
                          let username = subJson["user"]["username"].string,
                        let createdAt = subJson["created_at"].string else { return }
                    
                    let likesCount = subJson["likes"].intValue
                    
                    let photoItem = Photo(thumbnail: thumbnail, username: username, likesCount: likesCount, createdAt: createdAt)
                    // 배열에 넣고
                    photos.append(photoItem)
                }
                
                if photos.count > 0 {
                    completion(.success(photos))
                } else {
                    completion(.failure(.noContent))
                }
                
            })
        
    }
    
}
