//
//  MyApiStatusLogger.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/08/27.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import Alamofire

final class MyApiStatusLogger : EventMonitor {
    
    let queue = DispatchQueue(label: "MyApiStatusLogger")
    
//    func requestDidResume(_ request: Request) {
//        print("MyApiStatusLogger - requestDidResume()")
////        debugPrint(request)
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        
        guard let statusCode = request.response?.statusCode else { return }
        
        print("MyApiStatusLogger - request.didParseResponse() / statusCode : \(statusCode)")
        
        
//        debugPrint(response)
    }
    
    
}
