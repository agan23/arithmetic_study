/**
 * @Name: MSBST_Study.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/5/17
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import UIKit

class MSBST_Study: NSObject {
//    func insertNode(_ root: TreeNode?, _ val: Int) -> TreeNode? {
//        if root == nil {
//            return TreeNode(val)
//        }
//
//        if (root?.val ?? 0) > val {
//            insertNode(root?.left, val)
//        } else {
//            insertNode(root?.right, val)
//        }
//    }
    
    
    func test() {
        
        var t0 = TreeNode(9)
        var t1 = TreeNode(2)
        var t2 = TreeNode(10)
        var t3 = TreeNode(1)
        var t4 = TreeNode(0)
        var t5 = TreeNode(12)
        var t6 = TreeNode(7)
        var t61 = TreeNode(6)
        var t62 = TreeNode(8)
//        var t6 = TreeNode(6)
        t0.left = t1
        t0.right = t2
        t1.left = t3
        t1.right = t6
        t3.left = t4
        t2.right = t5
        t6.left = t61
        t6.right = t62
        
        bSearch(t0, 4)
        insertData(t0, 9)
        delete(t0, 2)
    }
    
    // 插入数据
    func insertData(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var d = root
        if d == nil {
            d = TreeNode(val)
            return d
        }
        
        while d != nil {
            if d?.val ?? 0 > val {
                if d?.left == nil {
                    d?.left = TreeNode(val)
                    break
                }
                d = d?.left
            } else {
                if d?.right == nil {
                    d?.right = TreeNode(val)
                    break
                }
                d = d?.right
            }
        }
        
        return root
    }
    
    // delete
    func delete(_ root: TreeNode?, _ target: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var p = root
        var pp: TreeNode? = nil
        
        // 判断是否能找到
        while p != nil && p?.val != target {
            pp = p
            if p?.val ?? 0 > target {
                p = p?.left
            } else {
                p = p?.right
            }
        }
        
        // 没找到
        if p == nil {
            return root
        }
        
        // 要删除的节点有两个直接点
        if p?.left != nil && p?.right != nil {
            var minP = p?.right
            var minPP = p
            while minP?.left != nil {
                minPP = minP
                minP = minP?.left
            }
            p?.val = minP?.val ?? 0
            // 删除minP 节点
            p = minP
            pp = minPP
        }
        
        var node: TreeNode? = nil
        if p?.left != nil {
            node = p?.left
        } else if p?.right != nil {
            node = p?.right
        } else {
            node = nil
        }
        
        // 根节点
        if pp == nil {
            return node
        } else if pp?.left?.val == p?.val {
            pp?.left = node
        } else {
            pp?.right = node
        }
        
        
        return root
    }
    
    // 查询数据
    func bSearch(_ root: TreeNode?, _ target: Int) -> Bool {
        // 迭代
        if root == nil {
            return false
        }
        
        if root?.val == target {
            return true
        } else if root?.val ?? 0 > target {
            return bSearch(root?.left, target)
        } else {
            return bSearch(root?.right, target)
        }
        
        
//        if root == nil {
//            return false
//        }
//
//        var d = root
//
//        while d != nil {
//            if d?.val == target {
//                return true
//            } else if d?.val ?? 0 > target {
//                d = d?.left
//            } else {
//                d = d?.right
//            }
//        }
//
//        return false
    }
}
