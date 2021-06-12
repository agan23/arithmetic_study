/**
 * @Name: Extension+Font.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/9
 * @Copyright: 
 */


import Foundation
import UIKit

extension UIFont {
    @objc dynamic func changeA() {
        print("changeA")
    }
    
    
    @objc dynamic func changeB() {
        print("changeB")
        var outCout: UInt32 = 0
        if let list = class_copyMethodList(Self.self, &outCout) {
            for i in 0..<numericCast(outCout) {
//                print(list[i])
                let method = list[i]
                
            }
        }
        
    }
    
    func methodSwizze(cls: AnyClass, originalSelector: Selector, swizzledSelector:Selector){
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzledMethod = class_getInstanceMethod(cls, swizzledSelector)

        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    
}
