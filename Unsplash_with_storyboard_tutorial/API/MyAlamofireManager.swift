//
//  MyAlamofireManager.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/08/27.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import Alamofire

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
    
}
