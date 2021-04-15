//
//  UIFont+Ext.swift
//  WJUtil
//
//  Created by wangjian01 on 2021/4/14.
//  Copyright © 2021 wangjian01. All rights reserved.
//

import UIKit
extension UIFont{
    public class func sc_regular(size:CGFloat)->UIFont{
        return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    public class func sc_semibold(size:CGFloat)->UIFont{
        return UIFont(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    public class func sc_medium(size:CGFloat)->UIFont{
        return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
