//
//  BaseVC.swift
//  Unsplash_with_storyboard_tutorial
//
//  Created by Jeff Jeong on 2020/08/21.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    
    
      var vcTitle : String = "" {
          didSet {
              print("UserListVC - vcTitle didSet() called / vcTitle : \(vcTitle)")
              self.title = vcTitle
          }
      }
    
}
