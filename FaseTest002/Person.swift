/**
 * @Name: Person.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/2/26
 * @Copyright: 
 */


import UIKit

class Person: NSObject {
    var name: String?
    
    override init() {
        
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
