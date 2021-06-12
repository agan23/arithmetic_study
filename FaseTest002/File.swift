/**
 * @Name: File.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/5/29
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import Foundation


// 取出某个对象的地址
func sg_getAnyObjectMemoryAddress(object: AnyObject) -> String {
    let str = Unmanaged<AnyObject>.passUnretained(object).toOpaque()
    return String(describing: str)
}

// 对比两个对象的地址是否相同
func sg_equateableAnyObject(object1: AnyObject, object2: AnyObject) -> Bool {
    let str1 = sg_getAnyObjectMemoryAddress(object: object1)
    let str2 = sg_getAnyObjectMemoryAddress(object: object2)
    
    if str1 == str2 {
        return true
    } else {
        return false
    }
}


extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        let l = sg_getAnyObjectMemoryAddress(lhs) as? String
        let r = sg_getAnyObjectMemoryAddress(lhs) as? String
        
        if l == r {
            return true
        } else {
            return false
        }
    }
    
    // 取出某个对象的地址
    func sg_getAnyObjectMemoryAddress(object: AnyObject) -> String {
        let str = Unmanaged<AnyObject>.passUnretained(object).toOpaque()
        return String(describing: str)
    }
}
