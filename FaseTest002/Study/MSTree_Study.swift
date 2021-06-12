/**
 * @Name: MSTree_Study.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/29
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import UIKit

class MSTree_Study: NSObject {
    
    func test() {
        var t0 = TreeNode(0)
        var t1 = TreeNode(1)
        var t2 = TreeNode(2)
        var t3 = TreeNode(3)
        var t4 = TreeNode(4)
        var t5 = TreeNode(5)
        var t6 = TreeNode(6)
        t0.left = t1
        t0.right = t2
        t1.left = t3
        t2.right = t4
        t4.left = t5
        t4.right = t6
        
        levTwoPrint(t0)
    }
    
    // 二叉树的高度
    func heightOfTree(_ root: TreeNode?) -> Int {
        return 0
        // 后续遍历求最大高度
        
        // 层级遍历
//        var maxH = 0
//        if root == nil {
//            return 0
//        }
//
//        var queue = [TreeNode]()
//        var p = root
//        queue.append(p!)
//
//        while !queue.isEmpty {
//            let node = queue.removeFirst()
//            maxH += 1
//            for _ in 0..<queue.count {
//                if let l = node.left {
//                    queue.append(l)
//                }
//                if let r = node.left {
//                    queue.append(r)
//                }
//            }
//        }
//
//        return maxH
        
        
        
        // 递归
//        if root == nil {
//            return 0
//        }
//
//        return max(heightOfTree(root?.left), heightOfTree(root?.right)) + 1
    }
    
    // 二叉树节点最大值
    func maxNodeInTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return Int.min
        }
        
        let left = maxNodeInTree(root?.left)
        let right = maxNodeInTree(root?.right)
        
        return max(max(left, right), root?.val ?? 0)
    }
    
    // 最大路径和
    var res: Int = Int.min
    func maxPath(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = max(0, maxPath(root?.left))
        let right = max(0, maxPath(root?.right))
        
        res = max(res, left + right + (root?.val ?? 0))
        
        return max(left, right) + (root?.val ?? 0)
    }
    
    // 测试二叉树相关内容
    // 锯齿波遍历
    func levTwoPrint(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [TreeNode]()
        var list = [[Int]]()
        var head = root
        queue.append(head!)
        var bF = true
        var node: TreeNode? = nil
        while !queue.isEmpty {
            let n = queue.count
            
            var lll = [Int]()
            for _ in 0..<n {
                node = queue.removeFirst()
                if bF {
                    lll.append(node?.val ?? 0)
                } else {
                    lll.insert(node?.val ?? 0, at: 0)
                }
                
//                print(node!.val)
                if let l = node?.left {
                    queue.append(l)
                }
                if let r = node?.right {
                    queue.append(r)
                }
            }
            bF = !bF
            list.append(lll)
        }
        
        // 遍历
        for l in list {
            for ll in l {
                print(ll)
            }
        }
        
        return list
    }
        
    // 层级遍历
    func levPrint(_ root: TreeNode?) {
        // [2]
        if root == nil {
            return
        }
        
        var queue = [TreeNode]()
        var p = root
        queue.append(p!)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            print(node.val)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        
//        if root == nil {
//            return
//        }
//
//        var queue = [TreeNode]()
//        var head = root
//        queue.append(head!)
//
//        while !queue.isEmpty {
//            let node = queue.removeFirst()
//            print(node.val)
//            if let left = node.left {
//                queue.append(left)
//            }
//            if let right = node.right {
//                queue.append(right)
//            }
//        }
    }
    
    // 后续遍历算法
    func bacPrint(_ root: TreeNode?) {
        // [2]
        if root == nil {
            return
        }
        var queue = [TreeNode]()
        var h = root
        var pQueue = [TreeNode]()
        
        while h != nil || !queue.isEmpty {
            while h != nil {
                queue.append(h!)
                pQueue.append(h!)
                h = h?.right
            }
            if !queue.isEmpty {
                h = queue.removeLast()
                h = h?.left
            }
            
            while pQueue != nil {
                let p = pQueue.removeLast()
                print(p.val)
            }
        }
        
        
//        if root == nil {
//            return
//        }
//
//        var queue = [TreeNode]()
//        var pQueue = [TreeNode]()
//        var head = root
//        while head != nil || !queue.isEmpty {
//            while head != nil {
//                queue.append(head!)
//                pQueue.append(head!)
//                head = head?.right
//            }
//            if !queue.isEmpty {
//                head = queue.removeLast()
//                head = head?.left
//            }
//        }
//        print(pQueue)
//        while !pQueue.isEmpty {
//            let model = pQueue.removeLast()
//            print(model.val)
//        }
    }
    
    // 中序遍历算法
    func midPrint(_ root: TreeNode?) {
        // [2]
        if root == nil {
            return
        }
        var queue = [TreeNode]()
        var h = root
        
        while h != nil || !queue.isEmpty {
            while h != nil {
                queue.append(h!)
                h = h?.left
            }
            
            if !queue.isEmpty {
                h = queue.removeLast()
                print(h?.val)
                h = h?.right
            }
        }
        
//        if root == nil {
//            return
//        }
//
//        var queue = [TreeNode]()
//        var head = root
//
//        while head != nil || !queue.isEmpty {
//            while head != nil {
//                queue.append(head!)
//                head = head?.left
//            }
//
//            if !queue.isEmpty {
//                head = queue.removeLast()
//                print(head?.val)
//                head = head?.right
//            }
//        }
    }
    
    // 前序遍历
    func prePrint(_ root: TreeNode?) {
//        if root == nil {
//            return
//        }
//
//        var queue = [TreeNode]()
//        var h = root
//
//        while h != nil || !queue.isEmpty {
//            while h != nil {
//                queue.append(h!)
//                print(h?.val)
//                h = h?.left
//            }
//
//            if !queue.isEmpty {
//                h = queue.removeLast()
//                h = h?.right
//            }
//        }
        
        
//        if root == nil {
//            return
//        }
//        var queue = [TreeNode]()
//        var head = root
//        while head != nil || !queue.isEmpty {
//            // 遍历到相应的点
//            while head != nil {
//                print(head?.val)
//                queue.append(head!)
//                head = head?.left
//            }
//
//            // 左子树为空的时候遍历右子树
//            if !queue.isEmpty {
//                head = queue.removeLast()
//                head = head?.right
//            }
//        }
        
        // 迭代递归的方式
//        if root == nil {
//            return
//        }
//        print(root?.val)
//        prePrint(root?.left)
//        prePrint(root?.right)
    }
}
