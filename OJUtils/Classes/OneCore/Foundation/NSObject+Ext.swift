//
//  NSObject+Ext.swift
//  WJUtil
//
//  Created by wangjian01 on 2021/4/14.
//  Copyright © 2021 wangjian01. All rights reserved.
//

import Foundation

public extension NSObject {
    class var named: String {
        let array = NSStringFromClass(self).components(separatedBy: ".")
        if let name =  array.last {
            return name
        }
        return ""
    }
    
    var named: String {
        let array = NSStringFromClass(type(of: self)).components(separatedBy: ".")
        if let name =  array.last {
            return name
        }
        return ""
    }
}
