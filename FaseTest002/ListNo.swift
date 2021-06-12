/**
 * @Name: ListNo.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/17
 * @Copyright: 
 */


import Foundation


public class MinLong {
    func getMax(nums: [Int]) -> Int {
        var res = 0
        for i in 0..<nums.count {
            res = max(res, nums[i])
        }
        
        return res
    }
    
    // [1, 3, 6, 2, 9, 4]
    func getLongest(nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        return self.getMax(nums: dp)
    }
    
    func longthOfLIS(num: [Int]) -> Int {
        var top = [Int](arrayLiteral: num.count)
        
        var piles = 0
        for i in 0..<num.count {
            let poker = num[i]
            
            var left = 0
            var right = piles
            
            while left < piles {
                let mid = (left + right) / 2
                if top[mid] > poker {
                    right = mid
                } else if top[mid] < poker {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            piles += 1
            top[left] = num[i]
        }
        
        return piles
    }
    

}

public class MinDistance {
    func minDistance(s1: String, s2: String) -> Int {
        func dp(i: Int, j: Int) -> Int {
            if i == -1 {
                return j + 1
            }
            if j == -1 {
                return i + 1
            }
            
            if s1[i] == s2[j] {
//                # 解释：
//                # 本来就相等，不需要任何操作
//                # s1[0..i] 和 s2[0..j] 的最小编辑距离等于
//                # s1[0..i-1] 和 s2[0..j-1] 的最小编辑距离
//                # 也就是说 dp(i, j) 等于 dp(i-1, j-1)
                return dp(i: i - 1, j: j - 1) // 啥都不做
            } else {
                return min(numbers:
                            // # 解释：
                            // # 我直接在 s1[i] 插入一个和 s2[j] 一样的字符
                            // # 那么 s2[j] 就被匹配了，前移 j，继续跟 i 对比
                            //  别忘了操作数加一
                           dp(i: i, j: j - 1) + 1, // insert
                           dp(i: i - 1, j: j) + 1, // delete
                           dp(i: i - 1, j: j - 1) + 1) // change
            }
        }
        
        return dp(i: s1.count - 1, j: s2.count - 1)
    }
    
    func min(numbers: Int ...) -> Int {
        var count = numbers.count
        var min: Int = Int.max
        
        while count > 0 {
            count -= 1
            min = min < numbers[count] ? min: numbers[count]
        }
        
        return min
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    
}

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


// 链表问题
public class ListNode {
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func reverser(root: ListNode?) -> ListNode? {
        guard let root = root else {
            return nil
        }
        var cur: ListNode? = root
        var pre: ListNode? = nil
        while cur != nil {
            let nextNode = cur?.next
            cur?.next = pre
            pre = cur
            cur = nextNode
        }
        
        return pre
    }
    
    static func reverserRecursion(root: ListNode?) -> ListNode? {
        if root == nil || root?.next == nil {
            return root
        }
        
        let last = reverserRecursion(root: root?.next)
        root?.next?.next = root
        root?.next = nil
        
        return last
    }
    
    static var successor: ListNode? = nil
    /// 翻转前N个串
    /// - Parameters:
    ///   - root: <#root description#>
    ///   - index: <#index description#>
    /// - Returns: <#description#>
    static func reverserRecursionN(root: ListNode?, index: Int) -> ListNode? {
        if index == 1 {
            successor = root?.next
            return root
        }
        
        let last = reverserRecursionN(root: root?.next, index: index - 1)
        root?.next?.next = root
        root?.next = successor
        
        return last
    }
    
    // 4 -> 3 -> 2 -> 5 -> nil [2, 3]
    static func reverserRecursionMN(root: ListNode?, indexM: Int, indexN: Int) -> ListNode? {
        if indexM == 1 {
            return reverserRecursionN(root: root, index: indexN)
        }
        
        root?.next = reverserRecursionMN(root: root?.next, indexM: indexM - 1, indexN: indexN - 1)
        
        return root
    }
}


public class TwoTreeNode {
    var val: Int
    var left: TwoTreeNode?
    var right: TwoTreeNode?
    
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    // 求最大值
    static func getMaxValue(root: TwoTreeNode?) -> Int {
        guard let root = root else {
            return -1
        }
        let lMax = getMaxValue(root: root.left)
        let rMax = getMaxValue(root: root.right)
        
        return  Int.getMaxDat(numbers: lMax, root.val, rMax)
    }
    
    
    
    //遍历
    static func preErgodic(root: TwoTreeNode?) {
        guard let root = root else {
            return
        }
        print("\(root.val) ")
        preErgodic(root: root.left)
        preErgodic(root: root.right)
    }
    
    static func midErgodic(root: TwoTreeNode?) {
        guard let root = root else {
            return
        }
        preErgodic(root: root.left)
        print("\(root.val) ")
        preErgodic(root: root.right)
    }
    
    static func endErgodic(root: TwoTreeNode?) {
        guard let root = root else {
            return
        }
        preErgodic(root: root.left)
        preErgodic(root: root.right)
        print("\(root.val) ")
        
        
    }
    
    // 遍历
//    static func findErigodic(root: TwoTreeNode?) {
//        guard let root = root else {
//            return
//        }
//
//        while <#condition#> {
//            <#code#>
//        }
//    }
}
