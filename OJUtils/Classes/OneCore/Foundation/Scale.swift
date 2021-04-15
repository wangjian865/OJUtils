//
//  Scale.swift
//  WJUtil
//
//  Created by wangjian01 on 2021/4/14.
//  Copyright © 2021 wangjian01. All rights reserved.
//

import UIKit
public extension CGFloat{
    var scale:CGFloat{
        return OJApp.scale(self)
    }
}

public extension Int{
    var scale:CGFloat{
        return OJApp.scale(CGFloat(self))
    }
}

public extension Double{
    var scale:CGFloat{
        return OJApp.scale(CGFloat(self))
    }
}
