/**
 * @Name: Stack_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/20
 * @Copyright: 
 */


import UIKit

class Stack_Test: NSObject {
    
    func test() {
        simplifyPath("/a/./b/../../c/")
    }
    
    // [71] 简化路径
    func simplifyPath(_ path: String) -> String {
        if path == "" {
            return "/"
        }
        
        var queue = [String]()
        // 将列表进行分割
        var list = path.components(separatedBy: "/")
        
        // 通过遍历将哪些不必要的 .或者..给去掉
        for str in list {
            if str == "." || str == "" {
                continue
            }
            if str == ".." {
                if !queue.isEmpty {
                    queue.removeLast()
                }
                continue
            }

            queue.append(String(str))
        }
        
        // 进行数组的重组
        var strr = ""
        queue.reverse()
        while !queue.isEmpty {
            let tmp = queue.removeLast()
            strr += "/"
            strr += tmp
        }
        
        if strr == "" {
            return "/"
        }
        
        return strr
    }
    
    // [42] 接雨水
    func trap(_ height: [Int]) -> Int {
        // 堆栈
        var ans = 0
        var queue = [Int]()
        
        for i in 0..<height.count {
            while !queue.isEmpty && height[i] > height[queue.last ?? 0] {
                let top = queue.popLast() ?? 0
                if queue.isEmpty {
                    break
                }
                
                let left = queue.last ?? 0
                
                let width = i - left - 1
                let height = min(height[i], height[left]) - height[top]
                ans += width * height
            }
            queue.append(height[i])
        }
        
        return ans
    }
    
    // [20] 有效的括号
    func isValid(_ s: String) -> Bool {
        if s == "" {
            return true
        }
        
        if s.count % 2 != 0 {
            return false
        }
        
        var queue = [Character]()
        
        var map: [Character: Character] = [ ")": "(",
                                            "}": "{",
                                            "]": "["]
        for c in s {
            if map.keys.contains(c)  {
                if queue.isEmpty || queue.last != map[c] {
                    return false
                }
                queue.removeLast()
            } else {
                queue.append(c)
            }
        }
        
        return queue.isEmpty
    }
}
