/**
 * @Name: AVLTree_Study.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/5/23
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import UIKit

// AVLTree是AVL树对应的类，而AVLTreeNode是AVL树节点，它是AVLTree的内部类。AVLTree包含了AVL树的根节点，AVL树的基本操作也定义在AVL树中。AVLTreeNode包括的几个组成对象:
// (01) key -- 是关键字，是用来对AVL树的节点进行排序的。
// (02) left -- 是左孩子。
// (03) right -- 是右孩子。
// (04) height -- 是高度。
public class AVLTreeNode<T> {
    var val: T
    var height: Int
    var left: AVLTreeNode?
    var right: AVLTreeNode?
    
    init(val: T) {
        self.val = val
        height = 0
        left = nil
        right = nil
    }
    
    init(val: T, _ l: AVLTreeNode?, _ r: AVLTreeNode?) {
        self.val = val
        height = 0
        left = l
        right = r
    }
    
    func treeHeight(_ root: AVLTreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return root?.height ?? 0
    }
    
    /*
     * LL：左左对应的情况(左单旋转)。
     *
     * 返回值：旋转后的根节点
     */
    func leftLeftRotation(_ root: inout AVLTreeNode<T>?) -> AVLTreeNode<T>? {
        if root == nil {
            return nil
        }
        
        var k: AVLTreeNode? = nil
        k = root?.left
        root?.left = k?.right
        k?.right = root
        
        root?.height = max(treeHeight(root?.left), treeHeight(root?.right)) + 1
        k?.height = max(treeHeight(k?.left), treeHeight(root)) + 1
        
        return k
    }
    
    // rightright rotory
    func rightRightRotation(_ root: inout AVLTreeNode?) -> AVLTreeNode? {
        if root == nil {
            return nil
        }
        
        var k: AVLTreeNode? = nil
        k = root?.right
        root?.right = k?.left
        k?.left = root
        
        root?.height = max(treeHeight(root?.left), treeHeight(root?.right)) + 1
        k?.height = max(treeHeight(k?.right), treeHeight(root)) + 1
        
        return k
    }
    
    // LR的旋转 第一次旋转是围绕"k1"进行的"RR旋转"，第二次是围绕"k3"进行的"LL旋转"。
    func leftRightRotation(_ root: inout AVLTreeNode?) -> AVLTreeNode? {
        if root == nil {
            return root
        }
        
        var left = root?.left
        root?.left = rightRightRotation(&left)
        
        return leftLeftRotation(&root)
    }
}

class AVLTree_Study: NSObject {
    func test() {
        
    }
}
