/**
 * @Name: Array_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/15
 * @Copyright: 
 */


import UIKit

class Array_Test: NSObject {
    
    func test() {
        let sum = maxArea([1,8,6,2,5,4,8,3,7])
        print(sum)
        
        var num = fourSum([0, 6, 9, -2, -1, 10, 1, 2], 7)
        print(num)
        
        var tow = threeSum2([-1,0,1,2,-1,-4])
    }
    
    // 15. 3Sum Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
    func threeSum2(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        if n < 3 {
            return []
        }
        
        return []
//        var dist = [Int: Int]()
        
//        let n = nums.count
//        if n < 3 {
//            return []
//        }
//
//        var list = nums.sorted {$0 < $1}
//        var ans = [[Int]]()
//        var sts = Set<[Int]>()
//        for i in 0..<n {
//            for j in (i + 1)..<n {
//                for k in (j + 1)..<n {
//                    if list[i] + list[j] + list[k] == 0 {
//                        sts.insert([list[i], list[j], list[k]])
//                    }
//                }
//            }
//        }
//
//        for item in sts {
//            ans.append(item)
//        }
//
//        return ans
        
//        let count = nums.count
//        if count < 3 {
//            return []
//        }
//
//        var list = nums.sorted(by: {$0 < $1})
//        var ans = [[Int]]()
//        for i in 0..<count {
//            // 无法满足
//            if list[i] > 0 {
//                break
//            }
//
//            if i > 0 && list[i] == list[i - 1] {
//                continue
//            }
//
//            var l = i + 1
//            var r = count - 1
//            while l < r {
//                if list[i] + list[l] + list[r] == 0 {
//                    ans.append([list[i], list[l], list[r]])
//                    while l < r && list[l] == list[l + 1] {
//                        l = l + 1
//                    }
//                    while l < r && list[r] == list[r - 1] {
//                        r = r - 1
//                    }
//                    l = l + 1
//                    r = r - 1
//                } else if list[i] + list[l] + list[r] > 0 {
//                    r = r - 1
//                } else {
//                    l = l + 1
//                }
//            }
//        }
//
//        return ans
    }
    
    // [1]  Two Sum - Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            let m = target -  nums[i]
            if map.keys.contains(m) {
                return [map[m]!, i]
            }
            map[nums[i]] = i
        }
        
        return []
    }
    
    // 27 - 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。 [2, 3, 4] 3
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let count = nums.count
        if count == 0 {
            return 0
        }
        
        var i = 0
        for j in 0..<count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        
        return i
    }
    
    // 26 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let count = nums.count
        if count <= 1 {
            return count
        }
        
        var i = 0
        for j in 1..<count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
    
    // 18 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let count = nums.count
        if count < 4 {
            return []
        }
        var list = nums
        var ans = Set<[Int]>()
        list.sort()
        
        for i in 0..<count - 1 {
            for j in (i + 1)..<count {
                var l = j + 1
                var r = count - 1
                
                while l < r {
                    let num = list[i] + list[j] + list[l] + list[r]
                    if num == target {
                        ans.insert([list[i], list[j], list[l], list[r]])
                        while l < r && list[l] == list[l + 1] {
                            l += 1
                        }
                        while l < r && list[r] == list[r - 1] {
                            r -= 1
                        }
                        l += 1
                        r -= 1
                    } else if num < target {
                        l += 1
                    } else {
                        r -= 1
                    }
                }
            }
        }
        
        return Array(ans)
    }
    
    // 16 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let count = nums.count
        if count < 3 {
            return 0
        }
        var list = nums
        list.sort()
        
        var minV = Int.max
        var res = 0
        
        for i in 0..<count {
            var l = i + 1
            var r = count - 1
            while l < r {
                var num = list[i] + list[l] + list[r]
                if minV > abs(target - num) {
                    minV = abs(target - num)
                    res = num
                }
                
                if minV == 0 {
                    return res
                }
                
                if num - target > 0 {
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        
        return res
    }
    
    // 15 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。注意：答案中不可以包含重复的三元组。
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count < 3 {
            return []
        }
        var list = nums
        var ans = [[Int]]()

        list.sort()
        
        for i in 0..<count {
            if list[i] > 0 {
                break
            }
            
            if i > 0 && list[i] == list[i - 1] {
                continue
            }
            
            var l = i + 1
            var r = count - 1
            while l < r {
                var num = list[i] + list[l] + list[r]
                if num == 0 {
                    ans.append([list[i], list[l], list[r]])
                    while l < r && list[l] == list[l + 1] {
                        l += 1
                    }
                    while l < r && list[r] == list[r - 1] {
                        r -= 1
                    }
                    l += 1
                    r -= 1
                } else if num < 0 {
                    l += 1
                } else if num > 0 {
                    r -= 1
                }
            }
        }
        
        return ans
    }
    
    // 11 - 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
    func maxArea(_ height: [Int]) -> Int {
        let count = height.count
        if count <= 1 {
            return 0
        }
        
        var big = count - 1
        var low = 0
        var max = 0
        var min = 0
        
        while low <= big {
            var h = 0
            var flag = false
            if height[low] < height[big] {
                min = low
                h = height[min]
                flag = true
            } else {
                min = big
                h = height[min]
                flag = false
            }
            let area = h * (big - low)
            if max < area {
                max = area
            }
            
            if flag {
                low += 1
            } else {
                big -= 1
            }
            
        }
        
        return max
    }
}
