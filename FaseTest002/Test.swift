/**
 * @Name: Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/16
 * @Copyright: 
 */


import Foundation

//计算机解决问题其实没有任何奇技淫巧，它唯一的解决办法就是穷举，穷举所有可能性。算法设计无非就是先思考“如何穷举”，然后再追求“如何聪明地穷举”。

// 动态规划问题的核心：求最值
// 最佳解决方案： 遍历
// 动态规划问题一定具有最优子结构
// 动态规划三要素： 重叠子问题、最优子结构、zhuangtaizhuan

// 1、明确状态
// 2、定义dp数组/函数的含义
// 3、明确选择
// 4、明确base case


public class DynamicPlan {
    // 凑零钱的问题 - 重点算是一个状态转移方程的问题
    static func coinChange(coins: [Int], amount: Int) -> Int {
        // 凑出来amount大小的硬币，需要help(n)个硬币
        func help(n: Int) -> Int {
            
            // base case
            if  n == 0 {
                return 0
            }
            if n < 0 {
                return -1
            }
            
            // 求最值
            var res: Int = Int.max
            // 做选择，需要硬币最多或者最少的那个就是答案
            for coin in coins {
                print(n)
                let sub = help(n: n - coin)
                // 子问题 无解
                if sub == -1 {
                    continue
                }
                res = min(res, 1 + sub)
            }
            
            return res
        }
        
        // 我们要求的目标金额
        return help(n: amount)
    }
    
    // 备忘录的方式
    static func coinChangeMemo(coins: [Int], amount: Int) -> Int {
        var dict = Dictionary<Int, Int>()
        // 凑出来amount大小的硬币，需要help(n)个硬币
        func help(n: Int) -> Int {
            
            if dict.keys.contains(n) {
                return dict[n] ?? 0
            }
            
            // base case
            if  n == 0 {
                return 0
            }
            if n < 0 {
                return -1
            }
            
            // 求最值
            var res: Int = Int.max
            // 做选择，需要硬币最多或者最少的那个就是答案
            for coin in coins {
                print(n)
                let sub = help(n: n - coin)
                // 子问题 无解
                if sub == -1 {
                    continue
                }
                res = min(res, 1 + sub)
            }
            if res != Int.max {
                dict[n] = res
            } else {
                dict[n] = -1
            }
            
            return res
        }
        
        // 我们要求的目标金额
        return help(n: amount)
    }
    
    static func coinChangeSimple(coins: [Int], amount: Int) -> Int {
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        
        dp[0] = 0
        
        for i in 0..<dp.count {
            for coin in coins {
                if i - coin < 0 {
                    continue
                }
                dp[i] = min(dp[i], 1 + dp[i - coin])
            }
        }
        
        return dp[amount]
    }
    
//    有一个很有趣的思路：既然回文串是一个正着反着读都一样的字符串，那么如果我们把s反转，称为s'，然后在s和s'中寻找最长公共子串，这样应该就能找到最长回文子串。
    // 寻找回文串的问题核心思想是：从中间开始向两边扩散来判断回文串。
    // 最长回文串
//    static func longestPalindrome(s: String) -> String {
//
//    }

//    static func palindRome(s: inout String, l: Int, r: Int) -> String {
//        var ll = l
//        var rr = r
//        while ll >= 0 && rr < s.count && s[ll] == s[rr] {
//            ll -= 1
//            rr += 1
//        }
//        
//        return s.substring(with: Range(NSRange(location: ll + 1, length: rr - ll - 1)) ?? NSRange(""))
//    }
}


extension String {
    subscript(Index:Int)->String
    {
        let begin = self.startIndex
        let start = self.index(begin, offsetBy: Index)
        let end = self.index(begin, offsetBy: Index+1)
        let range: Range = start..<end
        return String(self[range])
    }
}
