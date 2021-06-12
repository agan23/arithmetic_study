/**
 * @Name: Dongtai_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/22
 * @Copyright: 
 */


import UIKit

class Dongtai_Test: NSObject {

    func test() {
        let s = minPathSum([[1,3,1],[1,5,1],[4,2,1]])
        print(s)
    }
    
    // [64] 最小路径和
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        
        var dp = grid
        
        // 状态转移方程为什么？ dp[i][j] = dp[i - 1][j] + dp[i][j - 1] + dpi[j]
        // 初始条件
        dp[0][0] = grid[0][0]
        var mVal = dp[0][0]
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    continue
                }
                if i == 0 || j == 0 {
                    if i == 0 {
                        dp[i][j] = dp[i][j] + dp[i][j - 1]
                    } else {
                        dp[i][j] = dp[i][j] + dp[i - 1][j]
                    }
                    continue
                }
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + dp[i][j]
                
            }
        }
        
        return dp[m - 1][n - 1]
    }
    
    // [63] 不同路径 II
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var m = obstacleGrid.count
        var n = obstacleGrid[0].count
        
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        
        // 初始化第一行
        var bFlag = false
        for i in 0..<n {
            if bFlag {
                dp[0][i] = 0
                continue
            }
            if obstacleGrid[0][i] == 1 {
                dp[0][i] = 0
                bFlag = true
            } else {
                dp[0][i] = 1
            }
        }
        
        bFlag = false
        for i in 0..<m {
            if bFlag {
                dp[i][0] = 0
                continue
            }
            if obstacleGrid[i][0] == 1 {
                dp[i][0] = 0
                bFlag = true
            } else {
                dp[i][0] = 1
            }
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 0 {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        
        return dp[m - 1][n - 1]
        
//        let m = obstacleGrid.count
//        if m == 0 {
//            return 0
//        }
//        let n = obstacleGrid[0].count
//        if n == 0 {
//            return 0
//        }
//
//        if obstacleGrid[0][0] == 1 {
//            return 0
//        }
//
//        if m == 1 && n == 1 {
//            return 1
//        }
//
//        var list = obstacleGrid
//        list[0][0] = 10
//        for i in 0..<m {
//            if list[i][0] == 1 {
//                break
//            }
//            list[i][0] = 10
//        }
//        for i in 0..<n {
//            if list[0][i] == 1 {
//                break
//            }
//            list[0][i] = 10
//        }
//        for i in 0..<m {
//            for j in 0..<n {
//                if i == 0 && j == 0 {
//                    continue
//                }
//                if i == 0 || j == 0 {
//                    if list[i][j] == 1 {
//                        continue
//                    }
//                    if j != 0 && list[i][j - 1] != 1 {
//                        list[i][j] = list[i][j - 1]
//                    }
//                    if  i != 0 && list[i - 1][j] != 1 {
//                        list[i][j] = list[i - 1][j]
//                    }
//
//                    continue
//                }
//                if list[i][j - 1] != 1 && list[i - 1][j] != 1 && list[i][j] != 1 {
//                    list[i][j] = list[i][j - 1] + list[i - 1][j]
//                } else if list[i][j - 1] == 1 && list[i - 1][j] != 1 && list[i][j] != 1  {
//                    list[i][j] = list[i - 1][j]
//                } else if list[i][j - 1] != 1 && list[i - 1][j] == 1 && list[i][j] != 1  {
//                    list[i][j] = list[i][j - 1]
//                } else {
////                    return 0
//                }
//            }
//        }
//
//        return list[m - 1][n - 1] / 10
    }
    
    // [62] 不同路径
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 动态规划的转移方程 f[i][j] <- f[i - 1][j] 或者 f[i][j - 1] 这么两种
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
        for i in 0..<m {
            dp[i][0] = 1
        }
        for i in 0..<n {
            dp[0][i] = 1
        }
        
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        return dp[m - 1][n - 1]
    }
    
    
    // [53] 最大子序和
    func maxSubArray(_ nums: [Int]) -> Int {
        let n = nums.count
        if n < 1 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        
        var dp = [Int].init(repeating: 0, count: n)
        
        // base case
        dp[0] = nums[0]
        // 求状态转移方程
        var m = dp[0]
        for i in 1..<n {
            dp[i] = max(nums[i], nums[i] + dp[i - 1])
            m = max(m, dp[i])
        }
        
        return m
    }
    
    // [5] 最长回文子串
    func longestPalindrome(_ s: String) -> String {
        var list = [Character]()
        for item in s {
            list.append(item)
        }
        
        var res = ""
        
        var result = [Character]()
        for i in 0..<s.count {
            let s1 = palindrome(&list, i, i)
            let s2 = palindrome(&list, i, i + 1)
            
            result = result.count > s1.count ? result : s1
            result = result.count > s2.count ? result : s2
        }
        
        for item in result {
            res.append(item)
        }
        
        return res
    }
    
    func palindrome(_ s: inout [Character], _ left: Int, _ right: Int) ->  [Character] {
        var l = left
        var r = right
        while l >= 0 && r < s.count && s[l] == s[r] {
            l -= 1
            r += 1
        }
        
        var ss = [Character]()
        while (l + 1) <= (r - 1) {
            ss.append(s[l + 1])
            l += 1
        }
        
        return ss
    }
 }
