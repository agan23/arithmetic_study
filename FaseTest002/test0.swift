/**
 * @Name: test0.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/17
 * @Copyright: 
 */


import Foundation


class Test {
    static func test1() {
        let tree1 = TwoTreeNode(1)
        let tree2 = TwoTreeNode(2)
        let tree3 = TwoTreeNode(3)

        tree1.left = nil
        tree1.right = tree2
        tree2.left = tree3
        tree2.right = nil
        tree3.left = nil
        tree3.right = nil

        TwoTreeNode.endErgodic(root: tree1)
        let max = TwoTreeNode.getMaxValue(root: tree1)
        print(max)
    }
    
    static func test2() {
        let t = MinDistance()
        let n = t.minDistance(s1: "t1", s2: "s2")
        print(n)
        
        let m = MinLong()
        let nn = m.getLongest(nums: [2, 6, 5, 1])
        print(nn)
    }
    
    
}


extension Int {
    static func getMaxDat(numbers: Int ...) -> Int {
        var count = numbers.count
        var max: Int = Int.min
        
        while count > 0 {
            count -= 1
            max = max > numbers[count] ? max: numbers[count]
        }
        
        return max
    }
}
