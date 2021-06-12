/**
 * @Name: MSNormal_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/5/15
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import UIKit

class MSNormal_Test: NSObject {
    func test() {
        
    }
    
    // 二叉树的最大高度
    func treeHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return max(treeHeight(root?.left), treeHeight(root?.right))
    }
    
    // 一棵高度平衡二叉树定义为：
    // 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
    func isBalance(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        let left = treeHeight(root?.left)
        let right = treeHeight(root?.right)
        
        return (abs(left - right) <= 1) && isBalance(root?.left) && isBalance(root?.right)
    }
    
    // 给定二叉树根结点 root ，此外树的每个结点的值要么是 0，要么是 1。
    // 返回移除了所有不包含 1 的子树的原二叉树。
    // ( 节点 X 的子树为 X 本身，以及所有 X 的后代。)
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        root?.left = pruneTree(root?.left)
        root?.right = pruneTree(root?.right)
        if root?.left == nil && root?.right == nil && root?.val == 0 {
            return nil
        }
        
        return root
    }
}
