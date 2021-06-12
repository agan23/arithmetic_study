/**
 * @Name: Dongtai_study.swift
 * @Description: 动态规划学习部分
 * @Author: iBro
 * @Date: 2021/5/31
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import Foundation


class Dongtai_study: NSObject {
    
    class study: NSObject {
        
        // 一维
        func study1() {
            var dp = [Int].init(repeating: 1, count: 10)
            for i in 0..<10 {
                for j in 0..<i {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        // 二维
        func study2() {
            print("二维")
            var arr = [1, 2, 4, 5, 7, 8, 43, 12]
            var n = 10
            var dp = [[Int]].init(repeating: ([Int].init(repeating: 0, count: n)), count: n)
            for i in 0..<n {
                for j in 1..<n {
                    if arr[i] == arr[j] {
//                        dp[i][j] = dp[]
                    }
                }
            }
        }
        
        // 给点一个s1 s2 计算 s1 转为 s2的最小步骤   可以进行三种操作   1、插入 2、删除 3、替换
        func minDistanceA(_ s1: String, _ s2: String) -> Int {
            return dp_minDistance(s1, s2, s1.count - 1, s2.count - 1)
        }
        
        func dp_minDistance(_ s1: String, _ s2: String, _ iV: Int, _ jV: Int) -> Int {
            var i = iV
            var j = jV
            
            // base case
            if i == -1 {
                j += 1
                return j
            }
            
            if j == -1 {
                i += 1
                return i
            }
            
            if s1[i] == s2[j] {
                i -= 1
                j -= 1
                // to do nothing, just skip
                return dp_minDistance(s1, s2, i, j)
            } else {
                var minV = min(dp_minDistance(s1, s2, i, j - 1) + 1, dp_minDistance(s1, s2, i - 1, j) + 1)
                minV = min(minV, dp_minDistance(s1, s2, i - 1, j - 1) + 1)
                
                return minV
            }
        }
        
        func minThree<T: Comparable>(_ a: T, _ b: T, _ c: T) -> T {
            return min(a, min(b, c))
        }
    }
    
    // MARK: - Test
    func test() {
        let n = maxEnvelopes([[4,5],[4,6],[6,7],[2,3],[1,1]])
        print(n)
        
        let n1 = testkuohao(2)
        
        
        let n3 = testAdd(3)
        print(n3)
        
        let n4 = combine(4, 2)
    }
    
    func testAdd(_ n: Int) -> Int {
        if n <= 0 {
            return 1
        }
        
        if n == 1 {
            return 2
        }
        
        let t1 = testAdd(n - 1)
        let t2 = testAdd(n - 2)
        
        return t1 + t2
    }
    
    // [50] 分治
    func myPow(_ x: Double, _ n: Int) -> Double {
//        var flag = n > 0 ? true : false
//        let nN = n > 0 ? n : -n
//
//        var res = 1.0
//        for _ in 0..<nN {
//            res *= x
//        }
//
//        return flag == true ? res : 1 / res
        
        return n > 0 ? quick_mypow(x, n) : 1 / quick_mypow(x, n)
    }
    
    func quick_mypow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        
        let y = quick_mypow(x, n / 2)
        
        return n % 2 == 0 ? y * y : y * y * x
    }
    
    func testkuohao(_ n: Int) {
        help_testkuohao(0, 2 * n, "")
    }
    
    func help_testkuohao(_ level: Int, _ max: Int, _ str: String) {
        if str.count == max {
            print(str)
            
            return
        }
        
        help_testkuohao(level + 1, max, str + "(")
        help_testkuohao(level + 1, max, str + ")")
    }
    
    // 22 括号对数
    func generateParenthesis(_ n: Int) -> [String] {
        var list = [String]()
        help_generateParenthesis(0, 0, n, "", &list)
        
        return list
    }
    
    func help_generateParenthesis(_ left: Int, _ right: Int, _ n: Int, _ str: String, _ list: inout [String]) {
        if left == n && right == n {
            print(str)
            list.append(str)
            return
        }
        
        
        //
        if left < n {
            let s1 = str + "("
            help_generateParenthesis(left + 1, right, n, s1, &list)
        }
        if left > right {
            let s2 = str + ")"
            help_generateParenthesis(left, right + 1, n, s2, &list)
        }
        
        
    }
    
    // [32] 最长有效括号
//    func longestValidParentheses(_ s: String) -> Int {
//
//    }
    
    // [77] 组合
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        var list = [Int]()
        var pre = 0
        help_combine(&ans, n, k, &list, 0, &pre)
        
        return ans
    }
    
    func help_combine(_ ans: inout [[Int]], _ n: Int, _ k: Int, _ list: inout [Int],  _ index: Int, _ pre: inout Int) {
        if index == k {
            ans.append(list)
            return
        }
        
        for i in 1...n {
            if list.contains(i) {
                continue
            }
            if i < pre {
                continue
            }
            pre = i
            list.append(i)
            help_combine(&ans, n, k, &list, index + 1, &pre)
            pre = 0
            list.removeLast()
        }
        
//        help_combine(&ans, n + 1, k, &list, index + 1)
        
    }
    
    // [78] 子集
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var list = [Int]()
        dfs_subsets(&ans, nums, &list, 0)
        
        return ans
    }
    
    func dfs_subsets(_ ans: inout [[Int]], _ nums: [Int], _ list: inout [Int],  _ index: Int) {
        // 终止
        if index == nums.count {
            ans.append(list)
            return
        }
        
        // 空
        dfs_subsets(&ans, nums, &list, index + 1)
        list.append(nums[index])
        // 不空
        dfs_subsets(&ans, nums, &list, index + 1)
        
        list.removeLast()
    }
    
    // [70] 爬楼梯
    // 1 - 1
    // 2 - 2
    // 3 - 1 + 2
    func climbStairs(_ n: Int) -> Int {
        //
        
        // 状态转移
//        dp[i] = dp[i - 1] + dp[i - 2]
        
        // 初始条件
        if n <= 2 {
            return n
        }

        var a1 = 1
        var a2 = 2
        var a3 = a1 + a2

        for i in 2..<n {
            a3 = a1 + a2
            a1 = a2
            a2 = a3
        }

        return a3
    }
    
    func help_climbStairs(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        if n == 1 || n == 2 {
            return n
        }
        
        return help_climbStairs(n - 1) + help_climbStairs(n - 2)
    }
    
    // [72] 编辑距离
    func minDistance(_ word1: String, _ word2: String) -> Int {
        return help_minDistance(word1, word2, word1.count - 1, word2.count - 1)
    }
    
    var memDict = [[Int: Int]: Int]()
    func help_minDistance(_ word1: String, _ word2: String, _ iV: Int, _ jV: Int) -> Int {
        if memDict.keys.contains([iV: jV]) {
            return memDict[[iV: jV]] ?? 0
        }
        
        if iV == -1 {
            return jV + 1
        }
        if jV == -1 {
            return iV + 1
        }
        
        if word1[iV] == word2[jV] {
            memDict[[iV: jV]] = help_minDistance(word1, word2, iV - 1, jV - 1)
//            return help_minDistance(word1, word2, iV - 1, jV - 1)
        } else {
            let m1 = help_minDistance(word1, word2, iV - 1, jV) // 删除
            let m2 = help_minDistance(word1, word2, iV, jV - 1) // 插入
            let m3 = help_minDistance(word1, word2, iV - 1, jV - 1) // change
            
            memDict[[iV: jV]] = min(m1, min(m2, m3))
        }
        
        return memDict[[iV: jV]] ?? 0
    }
    
    // [322] 零钱兑换
    // 给定不同面额的硬币 coins 和一个总金额 amount。编写一个函数来计算可以凑成总金额所需的最少的硬币个数。如果没有任何一种硬币组合能组成总金额，返回 -1。 [1, 2, 5]  11
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        
        var max = amount + 1
        var dp = [Int].init(repeating: max, count: max)
        dp[0] = 0
        
        for i in 0...amount {
            for j in 0..<coins.count {
                if coins[j] <= i {
                    dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount]
    }
    
    
    // [354] 俄罗斯套娃信封问题
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        var n = envelopes.count
        var arr = envelopes.sorted { a, b in
            if a[0] == b[0] {
                if (b[1] - a[1]) >= 0 {
                    return false
                } else {
                    return true
                }
            } else if a[0] < b[0] {
                return true
            } else {
                return false
            }
        }
        
        var height = [Int]()
        for i in 0..<n {
            height.append(arr[i][1])
        }
        
        return longestSequence(height)
    }
    
    // [516] 最长回文子序列
    func longestPalindromeSubseq(_ s: String) -> Int {
        // [2]
        var n = s.count
        var dp = [Int].init(repeating: 1, count: n)
        
        for i in (0...(n-2)).reversed() {
            var pre = 0
            for j in (i + 1)..<n {
                var temp = dp[j]
                if s[i] == s[j] {
                    dp[j] = pre + 2
                } else {
                    dp[j] = max(dp[j], dp[j - 1])
                }
                
                pre = temp
            }
            
        }
        
        return dp[n - 1]
        
        // 1
//        var n = s.count
//        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: n)
//        for i in 0..<n {
//            for j in 0..<n {
//                dp[i][i] = 1
//            }
//        }
//        for i in (0...(n-1)).reversed() {
//            for j in ((i + 1)..<n) {
//                if s[i] == s[j] {
//                    dp[i][j] = dp[i + 1][j - 1] + 2
//                } else {
//                    dp[i][j] = max(dp[i + 1][j], dp[i][j - 1])
//                }
//            }
//        }
//
//        return dp[0][n - 1]
    }
    
    // 最长递增子序列 [1, 4, 2, 5, 7, 6, 10]
    func longestSequence(_ s: [Int]) -> Int {
        return 10
//        var n = s.count
//        var dp = [Int].init(repeating: 1, count: n)
//
//        for i in 0..<n {
//            for j in 0..<i {
//                if s[i] > s[j] {
//                    dp[i] = max(dp[i], dp[j] + 1)
//                }
//
//            }
//        }
//
//        return dp.max() ?? 0
        
        // [2] [1, 4, 2, 5, 7, 6, 10]
        // 二分法处理
        var piles = 0
        var n = s.count
        var tops = [Int].init(repeating: 0, count: n)
        
        for i in 0..<n {
            var left = 0
            var right = piles
            
            let p = s[i]
            
            while left < right {
                var mid = left + (right - left) >> 2
                if tops[mid] >= p {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            
            if left == right {
                piles += 1
            }
            tops[left] = p
        }
        
        
//        var piles = 0
//        var n = s.count
//        var top = [Int].init(repeating: 0, count: 1)
//        for i in 0..<n {
//            var left = 0
//            var right = piles
//            let p = s[i]
//
//            while left < right {
//                var mid = (left + right) >> 1
//                if top[mid] >= p {
//                    right = mid
//                } else {
//                    left = mid + 1
//                }
//            }
//
//            if left == right {
//                piles += 1
//            }
//
//            top[left] = p
//        }
//
//        return piles
    }
}
