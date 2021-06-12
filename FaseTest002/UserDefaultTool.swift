/**
 * @Name: UserDefaultTool.swift
 * @Description: 用于添加用户保存相关数据
 * @Author: iBro
 * @Date: 2021/3/5
 * @Copyright: CESTC
 */


import Foundation

@propertyWrapper
struct UserDefaultTool<T> {
    // 属性
    let key: String
    // 值
    let value: T
    
    init(_ key: String, value: T) {
        self.key = key
        self.value = value
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? value
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}


/// 保存参数配置信息
struct UserDefaultToolConfig {
    @UserDefaultTool("token", value: "") static var token: String
}
