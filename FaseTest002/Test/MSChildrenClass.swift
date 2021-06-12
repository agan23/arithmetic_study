/**
 * @Name: MSChildrenClass.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/23
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */

import UIKit

class MSFatherClass: NSObject {
    var name:String = "fuMName"
    var qq: String = "fuQQ"
}

class MSChildrenClass: NSObject {
    var age = 20
    var sex = true
    
    class func test() {
        let obj = MSChildrenClass()
        let mirror = Mirror(reflecting: obj)
        let supperMirror = Mirror(reflecting: obj)
        
    }
}
