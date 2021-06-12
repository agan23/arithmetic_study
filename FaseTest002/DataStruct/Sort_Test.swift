/**
 * @Name: Sort_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/18
 * @Copyright: 
 */


import UIKit

class Sort_Test: NSObject {
    func test() {
        let l11 = ListNode(9)
        let l12 = ListNode(7)
        let l13 = ListNode(3)
        let l14 = ListNode(4)
        let l15 = ListNode(5)
        
        l11.next = l12
        l12.next = l13
        l13.next = l14
        l14.next = l15
        
//        let sort = sortList(l11)
        
//        maximumGap([2, 3, 5, 1, 3])
        
//        largestNumber([0, 0])
//        containsNearbyAlmostDuplicate([1, 2, 3, 1], 3, 0)
        
        isAnagram("anagram", "nagaram")
    }
    
    // [20] 有效的括号
    
    
    // [242] 有效的字母异位词
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        var s0 = [Character]()
        var t0 = [Character]()
        for c in s {
            s0.append(c)
        }
        for c in t {
            t0.append(c)
        }
        
        s0.sort(by: { $0 > $1 })
        t0.sort(by: { $0 > $1 })
        
        return s0 == t0
    }
    
    // [220] 存在重复元素 III
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        for i in 0..<nums.count {
            for j in 1..<nums.count {
                if i != j && abs(nums[i] - nums[j]) <= t && abs(i - j) <= k {
                    return true
                }
            }
        }
        
        return false
    }
    
    // [179] 最大数
    func largestNumber(_ nums: [Int]) -> String {
        var list = nums
        list.sort{ "\($0)\($1)" > "\($1)\($0)" }
        print(list)
        var last = ""
        for i in 0..<list.count {
            last.append("\(list[i])")
        }
        
        if last.hasPrefix("0") {
            return "0"
        }
        return last
    }
    
    // [164] 最大间距 给定一个无序的数组，找出数组在排序之后，相邻元素之间最大的差值。 如果数组元素个数小于 2，则返回 0。
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        
        var list = nums
//        for i in 0..<list.count {
//            for j in 0..<(list.count - i - 1) {
//                if list[j] > list[j + 1] {
//                    (list[j], list[j + 1]) = (list[j + 1], list[j])
//                }
//            }
//        }
        
//        for i in 1..<list.count {
//            var val = list[i]
//            var j = i - 1
//            while j >= 0 {
//                if list[j] > val {
//                    list[j + 1] = list[j]
//                } else {
//                    break
//                }
//                j -= 1
//            }
//            list[j + 1] = val
//        }
        quickSort(&list, 0, list.count - 1)
        
        var maxV = list[1] - list[0]
        for i in 1..<list.count {
            maxV = max(maxV, list[i] - list[i - 1])
        }
        
        return maxV
    }
    
    // 归并
    func guibingSort(_ nums: inout [Int], _ p: Int, _ r: Int) {
        if p >= r {
            return
        }
        
        let mid = (p + r) >> 2
        guibingSort(&nums, p, mid)
        guibingSort(&nums, mid + 1, r)
    }
    
    func guibingMerge(_ nums: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
        var i = p
        var j = q + 1
        var k = 0
        
        var temp = Array(repeating: 0, count: r - p + 1)
        while i <= q && j <= r {
            if nums[i] <= nums[j] {
                temp[k] = nums[i]
                i += 1
            } else {
                temp[k] = nums[j]
                j += 1
            }
            k += 1
        }
        
        var start = i
        var end = q
        if j < r {
            start = j
            end = r
        }
        
        while start <= end {
            temp[k] = nums[start]
            k += 1
            start += 1
        }
        
        for i in 0...(r - p) {
            nums[p + i] = temp[i]
        }
    }
    
    // 快速排序
    func quickSort(_ nums: inout [Int], _ p: Int, _ r: Int) {
        if p >= r {
            return
        }
        
        let q = quickPartition(&nums, p, r)
        quickSort(&nums, p, q - 1)
        quickSort(&nums, q + 1, r)
    }
    
    func quickPartition(_ nums: inout [Int], _ p: Int, _ r: Int) -> Int {
        var pivot = nums[r]
        
        var i = p
        for j in p..<r {
            if nums[j] < pivot {
                if i == j {
                    i += 1
                } else {
                    (nums[i], nums[j]) = (nums[j], nums[i])
                    i += 1
                }
            }
        }
        (nums[i], nums[r]) = (nums[r], nums[i])
        
        return i
    }
    
    // [148] 排序链表 给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var list = [ListNode]()
        var h = head
        var n = 0
        while h != nil {
            list.append(h!)
            h = h?.next
            n += 1
        }
        
        for i in 1..<n {
            let node = list[i]
            var j = i - 1
            while j >= 0 {
                if list[j].val > node.val {
                    list[j + 1] = list[j]
                } else {
                    break
                }
                j -= 1
            }
            list[j + 1] = node
        }
        
        var nList: ListNode? = ListNode(0)
        var p: ListNode? = nList
        for i in 0..<list.count {
            p?.next = list[i]
            p = p?.next
        }
        p?.next = nil
        
        return nList?.next
    }

    
    // [57] 插入区间
//    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
//
//    }
    
    // [56] 合并区间
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var list = [[Int]]()
        var inters = intervals
        insert_sort(&inters)
        
        for i in 0..<inters.count {
            var l = inters[i][0]
            var r = inters[i][1]
            if list.count == 0 || list[list.count - 1][1] < l {
                list.append([l, r])
            } else {
                list[list.count - 1][1] = max(list[list.count - 1][1], r)
            }
        }
        
        return list
    }
    
    func insert_sort(_ intervals: inout [[Int]]) {
        if intervals.count <= 1 {
            return
        }
        
        let count = intervals.count
        
        for i in 1..<count {
            var val = intervals[i]
            var j = i - 1
            while j >= 0 {
                if intervals[j][0] > val[0] {
                    intervals[j + 1] = intervals[j]
                } else {
                    break
                }
                j -= 1
            }
            intervals[j + 1] = val
        }
    }
}
