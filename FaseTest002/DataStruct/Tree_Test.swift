/**
 * @Name: Tree_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/27
 * @Copyright: Copyright © 2021 微软（中国）亚洲研究院. All rights reserved.
 */


import UIKit

class Tree_Test: NSObject {
    
    func test() {
        
//        var t0 = TreeNode(2)
//        var t1 = TreeNode(2)
//        var t2 = TreeNode(5)
//        var t3 = TreeNode(5)
//        var t4 = TreeNode(6)
//        var t5 = TreeNode(5)
//        var t6 = TreeNode(6)
        var t0 = TreeNode(1)
        var t1 = TreeNode(2)
        var t2 = TreeNode(3)
        var t3 = TreeNode(4)
        var t4 = TreeNode(5)
        var t5 = TreeNode(6)
        var t6 = TreeNode(7)
        t0.left = t1
        t0.right = t2
//        t1.left = nil
        t2.left = t3
        t2.right = t4
//        t4.right = t6
//        let y = endorderTraversal(t0)
        var p0 = TreeNode(1)
        var p1 = TreeNode(2)
        var p2 = TreeNode(3)
        var p3 = TreeNode(4)
        var p4 = TreeNode(5)
        var p5 = TreeNode(6)
        var p6 = TreeNode(7)
        p0.left = p1
        p1.left = p2
        p2.left = p3
        p3.left = p4
        
        
        let n = pathSum(t0, 8)
        
//        let m = maxPathSum(p0)
        let nn = rightSideView(t0)
        print("-----------------------")
        
        let r = deserialize(serialize(t0))
        print("-----------------------")
        
    }
    
    func testVal(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let leftV = max(testVal(root?.left), 0)
        let rightV = max(testVal(root?.right), 0)
        
        print(leftV)
        
        let pathV = (root?.val ?? 0) + leftV
        
        return pathV
    }
    
    // [297] 二叉树的序列化与反序列化
    func serialize(_ root: TreeNode?) -> String {
        var mStr = ""
        help_serialize(root, &mStr)
        
        return mStr
    }
    
    func help_serialize(_ root: TreeNode?, _ str: inout String) {
        if root == nil {
            str.append("#,")
            return
        }
        str.append("\(root?.val ?? 0),")
        help_serialize(root?.left, &str)
        help_serialize(root?.right, &str)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var resL = [String]()
        for item in data.split(separator: ",") {
            resL.append("\(item)")
        }
        
        return help_deserialize(&resL)
    }
    
    func help_deserialize(_ list: inout [String]) -> TreeNode? {
        if list.isEmpty {
            return nil
        }
        
        let nodeS = list.removeFirst()
        if nodeS == "#" {
            return nil
        }
        let val = Int(nodeS) ?? 0
        var root = TreeNode(val)
        root.left = help_deserialize(&list)
        root.right = help_deserialize(&list)
        
        return root
    }
    
    // [257] 二叉树的所有路径
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var paths = [String]()
        help_binaryTreePaths(root, &paths, "")
        
        return paths
    }
    
    func help_binaryTreePaths(_ root: TreeNode?, _ paths: inout [String], _ pathV: String) {
        var p = root
        if p != nil {
            var path = pathV
            path.append("\(p?.val ?? 0)")
            if p?.left == nil && p?.right == nil {
                paths.append(path)
            } else {
                help_binaryTreePaths(root?.left, &paths, path)
                help_binaryTreePaths(root?.right, &paths, path)
            }
        }
    }
    
    // [236] 二叉树的最近公共祖先
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == p || root == q {
            return root
        }
        
        if root != nil {
            let l = lowestCommonAncestor(root?.left, p, q)
            let r = lowestCommonAncestor(root?.right, p, q)
            
            if l != nil && r != nil {
                return root
            } else if l != nil {
                return r
            } else {
                return l
            }
        }
        
        return nil
    }
    
    var lowest_ans: TreeNode? = nil
    func getLowest(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if root == nil {
            return false
        }
        
        let l = getLowest(root?.left, p, q)
        let r = getLowest(root?.right, p, q)
        if (l && r) || ((root?.val == p?.val || root?.val == q?.val) && l || r) {
            lowest_ans = root
        }
        
        return l || r || (root?.val == p?.val || root?.val == q?.val)
    }
    
    func get_lowestCommonAncestor(_ root: TreeNode?, _ r: TreeNode?) -> [TreeNode] {
        var p = root
        var queue = [TreeNode]()
        
        queue.append(p!)
        var pre: TreeNode? = nil
        
        while p != r {
//            p = queue.last
            while p != nil {
                queue.append(p!)
                p = p?.left
            }
            
            if !queue.isEmpty {
                p = queue.removeLast()
                if p == r {
                    queue.append(p!)
                    return queue
                }
                
                if p?.left != nil {
                    pre = p
                } else {
                    p = p?.right
                }
            }
        }
        
        return queue
    }
    
    // [235] 二叉搜索树的最近公共祖先
    func lowestCommonAncestorA(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let pV = p?.val ?? 0
        let qV = q?.val ?? 0
        
        var pT = root
        
        while true {
            if (pT?.val ?? 0) < pV && (pT?.val ?? 0) < qV {
                pT = pT?.left
            } else if (pT?.val ?? 0) < pV && (pT?.val ?? 0) < qV {
                pT = pT?.right
            } else {
                break
            }
        }
        
        return pT
        
        // [2]
//        if root == nil {
//            return nil
//        }
//
//        let pV = p?.val ?? 0
//        let qV = q?.val ?? 0
//
//        let rV = root?.val ?? 0
//
//        var list1 = [TreeNode]()
//        help_lowestCommonAncestor(root?.left, p, &list1)
//        var list2 = [TreeNode]()
//        help_lowestCommonAncestor(root?.left, p, &list2)
//
//
//        var pp: TreeNode? = nil
//        while list1.count > 0 && list2.count > 0 {
//            pp = list1.first
//            if list1.first?.val == list2.first?.val {
//                list1.removeFirst()
//                list2.removeFirst()
//            }
//        }
//
//        return pp
    }
    
    func help_lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ list1: inout [TreeNode]) {
        if root == nil || p == nil {
            return
        }
        
        var pT = root
        while pT != nil {
            list1.append(pT!)
            if (pT?.val ?? 0) > (p?.val ?? 0) {
                pT = pT?.left
            } else if (pT?.val ?? 0) > (p?.val ?? 0) {
                pT = pT?.right
            } else {
                break
            }
        }
    }
    
    // 230] 二叉搜索树中第K小的元素
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return 0
        }
        var val = 0
        var p = root
        var pre: TreeNode? = nil
        while p != nil {
            if p?.left == nil {
                val += 1
                if val == k {
                    return p?.val ?? 0
                }
                p = p?.right
            } else {
                pre = p?.left
                while pre?.right != nil && pre?.right?.val != p?.val {
                    pre = pre?.right
                }
                
                if pre?.right == nil {
                    pre?.right = p
                    p = p?.left
                } else {
                    pre?.right = nil
                    val += 1
                    if val == k {
                        return p?.val ?? 0
                    }
                    p = p?.right
                }
            }
        }
        
        return 0
        
        
//        var nums = [Int]()
//        help_kthSmallest(root, &nums)
//
//        return nums[k]
    }
    
    func help_kthSmallest(_ root: TreeNode?, _ nums: inout [Int]) {
        if root == nil {
            return
        }
        
        help_kthSmallest(root?.left, &nums)
        nums.append(root?.val ?? 0)
        help_kthSmallest(root?.right, &nums)
    }
    
    // [226] 翻转二叉树
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let left = root?.left
        let right = root?.right
        
        root?.left = right
        root?.right = left
        
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
    }
    
    // [222] 完全二叉树的节点个数
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = countNodes(root?.left)
        let right = countNodes(root?.right)
        
        return 1 + left + right
    }
    
    // [199] 二叉树的右视图
    func rightSideView(_ root: TreeNode?) -> [Int] {
        // [1]
        var dict = [Int: Int]()
        
        var maxDepth = -1
        
        var levels = [Int]()
        levels.append(0)
        var queue = [TreeNode]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let node = queue.removeLast()
            let level = levels.removeLast()
            
            maxDepth = max(maxDepth, level)
            
            if !dict.keys.contains(level) {
                dict[level] = node.val
            }
            
            if let left = node.left {
                queue.append(left)
                levels.append(level + 1)
            }
            if let right = node.right {
                queue.append(right)
                levels.append(level + 1)
            }
        }
        
        var list = [Int]()
        for i in 0...maxDepth {
            list.append(dict[i] ?? 0)
        }
        
        return list
        
        // [1]
//        if root == nil {
//            return []
//        }
//
//        var queue = [TreeNode]()
//        queue.append(root!)
//
//        var vals = [Int]()
//        while !queue.isEmpty {
//            let n = queue.count
//            for i in 0..<n {
//                var node = queue.removeFirst()
//                if i == n - 1 {
//                    vals.append(node.val)
//                }
//                if let left = node.left {
//                    queue.append(left)
//                }
//
//                if let right = node.right {
//                    queue.append(right)
//                }
//            }
//        }
//
//        return vals
    }
    
    // [144] 二叉树的前序遍历
    var pre_list = [Int]()
    func preorderTraversalA(_ root: TreeNode?) -> [Int] {
        // [1]
        if root == nil {
            return pre_list
        }
        
        var p = root
        var pre: TreeNode? = nil
        while p != nil {
            if p?.left == nil {
                pre_list.append(p?.val ?? 0)
                p = p?.right
            } else {
                pre = p?.left
                
                while pre?.right != nil && pre?.right?.val == p?.val {
                    pre = pre?.right
                }
                
                if pre?.right == nil {
                    pre?.right = p
                    pre_list.append(p?.val ?? 0)
                    p = p?.left
                } else {
                    pre?.right = nil
                    p = p?.right
                }
            }
        }
        
        return pre_list
        // [2]
//        if root == nil {
//            return []
//        }
//
//        var queue = [TreeNode]()
//
//        var p = root
//
//        while p != nil || !queue.isEmpty {
////            pre_list.append(node.val)
//            while p != nil {
//                pre_list.append(p?.val ?? 0)
//                queue.append(p!)
//                p = p?.left
//            }
//
//            if !queue.isEmpty {
//                p = queue.removeLast()
//                p = p?.right
//            }
//
//
//        }
//
//        return pre_list
        
        // [1]
//        help_pre(root)
//        return pre_list
    }
    
    func help_pre(_ root: TreeNode?) {
        
            if root == nil {
                return
            }
        preorderTraversalA(root?.left)
        preorderTraversalA(root?.right)
        pre_list.append(root?.val ?? 0)
    }
    
    // [129] 求根节点到叶节点数字之和
    func sumNumbers(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right == nil {
            return root?.val ?? 0
        }
        
        var queue = [TreeNode]()
        var vals = [Int]()
        var sum = 0
        
        queue.append(root!)
        vals.append(root?.val ?? 0)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            var num = vals.removeFirst()
            
            var left = node.left
            var right = node.right
            if left == nil && right == nil {
                return sum + num
            } else {
                if left != nil {
                    queue.append(left!)
                    vals.append(sum * 10 + (left?.val ?? 0))
                }
                
                if right != nil {
                    queue.append(right!)
                    vals.append(sum * 10 + (right?.val ?? 0))
                }
            }
        }
        
        return sum
        
        
        // [2]
        return dfs_sumNumbers(root, 0)
    }
    
    func dfs_sumNumbers(_ root: TreeNode?, _ preV: Int) -> Int {
        if root == nil {
            return 0
        }
        
        let val = preV * 10 + (root?.val ?? 0)
        
        if root?.left == nil && root?.right == nil {
            return val
        } else {
            let left = dfs_sumNumbers(root?.left, val)
            let right = dfs_sumNumbers(root?.right, val)
            
            return left + right
        }
    }
    
    func help_sumNumbers(_ root: TreeNode?, _ preV: Int) -> Int {
        if root == nil {
            return  0
        }
        
        let val = preV + (root?.val ?? 0)
        
        if root?.left == nil && root?.right == nil {
            return val
        }
        
        let left = help_sumNumbers(root?.left, val * 10)
        let right = help_sumNumbers(root?.right, val * 10)
        
        return left + right
    }
    
    // [124] 二叉树中的最大路径和
    func maxPathSum(_ root: TreeNode?) -> Int {
        var max = Int.min
        help_maxPathSum(root, &max)
        
        return max
    }
    
    func help_maxPathSum(_ root: TreeNode?, _ maxV: inout Int) -> Int {
        if root == nil {
            return 0
        }
        
        let leftV = max(help_maxPathSum(root?.left, &maxV), 0)
        let rightV = max(help_maxPathSum(root?.right, &maxV), 0)
        
        let pathV = (root?.val ?? 0) + leftV + rightV
        maxV = max(pathV, maxV)
        
        let val = (root?.val ?? 0) + max(leftV, rightV)
        
        return val
    }
    
    // [117] 填充每个节点的下一个右侧节点指针 II
    func connectA(_ root: Node?) -> Node? {
        if root == nil {
            return root
        }
        
        var queue = [Node]()
        queue.append(root!)
        
        while !queue.isEmpty {
            var n = queue.count
            for i in 0..<n {
                let p = queue.removeFirst()
                if i < n - 1 {
                    p.next = queue.first
                }
                if i == n - 1 {
                    p.next = nil
                }
                if let left = p.left {
                    queue.append(left)
                }
                if let right = p.right {
                    queue.append(right)
                }
            }
            
        }
        
        return root
    }
    
    // [116] 填充每个节点的下一个右侧节点指针 完美二叉树
    func connect(_ root: Node?) -> Node? {
        // bfs
        if root == nil {
            return root
        }
        
        var queue = [Node]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let n = queue.count
            for i in 0..<n {
                let p = queue.removeFirst()
                if i < n - 1 {
                    p.next = queue.first
                }
                if let left = p.left {
                    queue.append(left)
                }
                if let right = p.right {
                    queue.append(right)
                }
            }
        }
        
        
        return root
        // 递归
//        if root == nil {
//            return root
//        }
//
//        help_connect(root?.left, root?.right)
//
//        return root
    }
    
    func help_connect(_ l: Node?, _ r: Node?) {
        if l == nil || r == nil {
            return
        }
        
        l?.next = r
        
        help_connect(l?.left, l?.right)
        help_connect(l?.right, r?.left)
        help_connect(r?.left, r?.right)
    }
    
    // [114] 二叉树展开为链表
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        flatten(root?.left)
        flatten(root?.right)
        
        let left = root?.left
        let right = root?.right
        
        if left == nil && right == nil {
            return
        }
        
        root?.left = nil
        root?.right = left
        
        var node: TreeNode? = root
        while node?.right != nil {
            node = node?.right
        }
        node?.right = right
    }
    
    // [113] 路径总和 II
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        var res = [[Int]]()
        var list = [Int]()
        dfs_pathSum(root, targetSum, 0, &res, &list)
        
        return res
    }
    
    func dfs_pathSum(_ root: TreeNode?, _ target: Int, _ totalV: Int, _ result: inout [[Int]], _ list: inout [Int]) {
        if root == nil {
            return
        }
        
        var total = totalV
        
        list.append(root?.val ?? 0)
        total += (root?.val ?? 0)
        if root?.left == nil && root?.right == nil {
            if target == total {
                result.append(list)
            }
            list.removeLast()
            return
        }
        
        if let left = root?.left {
            dfs_pathSum(left, target, total, &result, &list)
        }
        if let right = root?.right {
            dfs_pathSum(right, target, total, &result, &list)
        }
    }
    
    // [112] 路径总和
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        // [1] dfs
        if root == nil {
            return false
        }
        if root?.left == nil && root?.right == nil {
            return root?.val == targetSum
        }
        
        var vals = [Int]()
        var queue = [TreeNode]()
        queue.append(root!)
        vals.append(root?.val ?? 0)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let val = vals.removeFirst()
            if node.left == nil && node.right == nil {
                if val == targetSum {
                    return true
                }
            }
            if let left = node.left {
                queue.append(left)
                vals.append(left.val + val)
            }
            if let right = node.right {
                queue.append(right)
                vals.append(right.val + val)
            }
        }
        
        
        return false
        
        // [2]
//        if root == nil {
//            return false
//        }
//
//        if root?.left == nil && root?.right == nil {
//            return root?.val == targetSum
//        }
//
//        return hasPathSum(root?.left, targetSum - (root?.val ?? 0)) || hasPathSum(root?.right, targetSum - (root?.val ?? 0))
    }
    
    // [111] 二叉树的最小深度 叶子节点就是左右子树都未空的子树
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left == nil && root?.right == nil {
            return 1
        }
        
        var minV = Int.max
        if let left = root?.left {
            minV = min(minV, minDepth(left))
        }
        
        if let right = root?.right {
            minV = min(minV, minDepth(right))
        }
        
        return minV + 1
        
//        if root == nil {
//            return 0
//        }
//
//        var queue = [TreeNode]()
//        queue.append(root!)
//        var levels = 1
//        while !queue.isEmpty {
//            let n = queue.count
//            for i in 0..<n {
//                let node = queue.removeFirst()
//                if node.left == nil && node.right == nil {
//                    return levels
//                }
//                if let left = node.left {
//                    queue.append(left)
//                }
//
//                if let right = node.right {
//                    queue.append(right)
//                }
//            }
//            levels += 1
//        }
//        return levels
    }
    
    // [110] 平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        return help_isBalanced(root) == -1 ? false : true
    }
    
    func help_isBalanced(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let l = help_isBalanced(root?.left)
        let r = help_isBalanced(root?.right)
        
        if l == -1 || r == -1 || abs(l - r) > 1 {
            return -1
        } else {
            return max(l, r) + 1
        }
    }
    
    
    
    // [108] 将有序数组转换为二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        help_sortedArrayToBST(nums, 0, nums.count - 1)
    }
    
    func help_sortedArrayToBST(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
        if low > high {
            return nil
        }
        
        var mid = low + (high - low) >> 1
        var root = TreeNode(nums[mid])
        root.left = help_sortedArrayToBST(nums, low, mid - 1)
        root.right = help_sortedArrayToBST(nums, mid + 1, high)
        
        return root
    }
    
    // [105] 从前序与中序遍历序列构造二叉树
    var buildTreeDict = [Int: Int]()
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for i in 0..<inorder.count {
            buildTreeDict[inorder[i]] = i
        }
        
        return help_buildTree(preorder, inorder, 0, preorder.count - 1, 0, inorder.count)
    }
    
    func help_buildTree(_ pre: [Int], _ inO: [Int], _ preStart: Int, _ preEnd: Int, _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd {
            return nil
        }
        
        var mid = buildTreeDict[pre[preStart]] ?? 0
//        for i in inStart...inEnd {
//            if inO[i] == pre[preStart] {
//                mid = i
//                break
//            }
//        }
        let leftSize = mid - inStart
        let root = TreeNode(pre[preStart])
        root.left = help_buildTree(pre, inO, preStart + 1, preStart + leftSize, inStart, mid - 1)
        root.right = help_buildTree(pre, inO, preStart + leftSize + 1, preEnd, mid + 1, inEnd)
        
        return root
    }
    
    // [104] 二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    // [103] 二叉树的锯齿形层序遍历
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var queue = [TreeNode]()
        queue.append(root!)
        var list = [[Int]]()
        var flag = true
        while !queue.isEmpty {
            let n = queue.count
            var i = 0
            var array = [Int]()
            while i < n {
                let node = queue.removeFirst()
                if flag {
                    array.append(node.val ?? 0)
                } else {
                    array.insert(node.val ?? 0, at: 0)
                }
                if let l = node.left {
                    queue.append(l)
                }
                if let r = node.right {
                    queue.append(r)
                }
                i += 1
            }
            flag = !flag
            list.append(array)
        }

        return list
    }
    
    // [102] 二叉树的层序遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var list = [[Int]]()
        help_levelOrder(1, root, &list)
        
        return list
        
//        var queue = [TreeNode]()
//        queue.append(root!)
//        var list = [[Int]]()
//        while !queue.isEmpty {
//            let n = queue.count
//            var i = 0
//            var array = [Int]()
//            while i < n {
//                let node = queue.removeFirst()
//                array.append(node.val ?? 0)
//                if let l = node.left {
//                    queue.append(l)
//                }
//                if let r = node.right {
//                    queue.append(r)
//                }
//                i += 1
//            }
//            list.append(array)
//        }
//
//        return list
    }
    
    func help_levelOrder(_ index: Int, _ root: TreeNode?, _ list: inout [[Int]]) {
        if list.count < index {
            list.append([])
            list[index - 1] = [Int]()
        }
        
        list[index - 1].append(root?.val ?? 0)
        if let left = root?.left {
            help_levelOrder(index + 1, left, &list)
        }
        if let right = root?.right {
            help_levelOrder(index + 1, right, &list)
        }
    }
    
    // [101] 对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return build_isSymmetric(root?.left, root?.right)
    }
    
    func build_isSymmetricA(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if l == nil && r == nil {
            return true
        }
        
        var nilNode: TreeNode = TreeNode(Int.min)
        var queue = [TreeNode]()
        
        queue.append(l ?? nilNode)
        queue.append(r ?? nilNode)
        
        while !queue.isEmpty {
            let a = queue.removeFirst()
            let b = queue.removeFirst()
            
            if a.val == nilNode.val && b.val == nilNode.val {
                continue
            }
            
            if a.val != b.val || a.val == nilNode.val || b.val == nilNode.val {
                return false
            }
            
            queue.append(a.left ?? nilNode)
            queue.append(b.right ?? nilNode)
            queue.append(a.right ?? nilNode)
            queue.append(b.left ?? nilNode)
        }
        
        return true
    }
    
    func build_isSymmetric(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if l == nil && r == nil {
            return true
        }
        
        if l == nil || r == nil {
            return false
        }
        
        if l?.val != r?.val  {
            return false
        }
        
        return build_isSymmetric(l?.left, r?.right) && build_isSymmetric(l?.right, r?.left)
    }
    
    // [100] 相同的树
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // [2]
        if p == nil && q == nil {
            return true
        }

        if p == nil || q == nil {
            return false
        }
        
        var queue = [TreeNode]()
        queue.append(p!)
        queue.append(q!)
        
        let nilNode = TreeNode(Int.min)
        
        while !queue.isEmpty {
            let a = queue.removeFirst()
            let b = queue.removeFirst()
            
            if a.val == nilNode.val && b.val == nilNode.val {
                continue
            }
            
            if (a.val != b.val) || a.val == nilNode.val || b.val == nilNode.val {
                return false
            }
            queue.append(a.left ?? nilNode)
            queue.append(b.left ?? nilNode)
            queue.append(a.right ?? nilNode)
            queue.append(b.right ?? nilNode)
        }
        
        return true
        
        // [1]
//        if p == nil && q == nil {
//            return true
//        }
//
//        if p == nil || q == nil {
//            return false
//        }
//
//        if p?.val != q?.val {
//            return false
//        }
//
//        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    // [98] 验证二叉搜索树
    func isValidBST(_ root: TreeNode?) -> Bool {
        var maxV = Int.min
        var p = root
        var queue = [TreeNode]()
        
        while !queue.isEmpty || p != nil {
            while p != nil {
                queue.append(p!)
                p = p?.left
            }
            
            p = queue.removeLast()
            if (p?.val ?? 0) <= maxV {
                return false
            }
            
            maxV = p?.val ?? 0
            p = p?.right
        }
        
        return true
        
//        if root == nil {
//            return true
//        }
//        return help_isValidBST(root, nil, nil)
    }
    
    func help_isValidBST(_ root: TreeNode?, _ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        if l != nil && (l?.val ?? 0) > (root?.val ?? 0) {
            return false
        }
        
        if r != nil && (r?.val ?? 0) < (root?.val ?? 0) {
            return false
        }
        
        return help_isValidBST(root?.left, l, root) && help_isValidBST(root?.right, root, r)
    }
    
    // [96] 不同的二叉搜索树
    func numTrees(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return n
        }
        
        return help_numTrees(1, n).count
    }
    var nums = 0
    func help_numTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        var vector = [TreeNode?]()
        for i in start...end {
            let lefts = help_numTrees(start, i - 1)
            let right = help_numTrees(i + 1, end)
            for left in lefts {
                for right in right {
//                    let cur = TreeNode(i)
//                    cur.left = left
//                    cur.right = right
//                    vector.append(cur)
                    nums += 1
                }
            }
        }
        
        return vector
    }
    
    // [95] 不同的二叉搜索树 II
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        return help_createBSTTree(1, n)
    }
    
    func help_createBSTTree(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }
        
        var vector = [TreeNode?]()
        for i in start...end {
            let lefts = help_createBSTTree(start, i - 1)
            let rights = help_createBSTTree(i + 1, end)
            
            for left in lefts {
                for right in rights {
                    let cur = TreeNode(i)
                    cur.left = left
                    cur.right = right
                    vector.append(cur)
                }
            }
        }
        
        return vector
    }
    
    // 遍历一棵树
    func bianliTree(_ root: TreeNode?) {
//        // 前序
//        print(root?.val)
//        bianliTree(root?.left)
//        bianliTree(root?.right)
//
//
//        // 中序
//        bianliTree(root?.left)
//        print(root?.val)
//        bianliTree(root?.right)
//
//        // 后续序
//        bianliTree(root?.left)
//        print(root?.val)
//        bianliTree(root?.right)
    }
    
    func qianxuBianli(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var queue = [TreeNode]()
        var head = root
        while head != nil || !queue.isEmpty {
            while head != nil {
                print(head?.val)
                queue.append(head!)
                head = head?.left
            }
            
            if !queue.isEmpty {
                head = queue.removeLast()
                head = head?.right
//                print(node.val)
            }
        }
    }
    
    func zhongxuBianli(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var queue = [TreeNode]()
        var p = root
        while p != nil || !queue.isEmpty {
            while p != nil {
                queue.append(p!)
                p = p?.left
            }
            
            if !queue.isEmpty {
                p = queue.removeLast()
                print(p?.val)
                p = p?.right
            }
        }
    }
    
    func houxubianli(_ root: TreeNode?) {
        if root == nil {
            return
        }
        
        var queue = [TreeNode]()
        var pQueue = [TreeNode]()
        var p = root
        while p != nil || !queue.isEmpty {
            while p != nil {
                queue.append(p!)
                pQueue.append(p!)
                p = p?.right
            }
            
            if !queue.isEmpty {
                p = queue.removeLast()
                p = p?.left
            }
        }
        
        while !pQueue.isEmpty {
            var node = pQueue.removeLast()
            print(node.val)
        }
    }
    
    
    // [94-2] 二叉树的后序遍历
    var ends = [Int]()
    func endorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return ends
        }
        
        var dump: TreeNode? = TreeNode(0)
        dump?.left = root
        var p = dump
        var pred: TreeNode? = nil
        while p != nil {
            if p?.left != nil {
                pred = p?.left
                while pred?.right != nil && pred?.right?.val != p?.val {
                    pred = pred?.right
                }
                
                if pred?.right == nil {
                    pred?.right = p
                    p = p?.left
//                    ends.append(p?.val ?? 0)
                } else {
                    pred?.right = nil
                    var t = p?.left
                    var list = [Int]()
                    while t != nil {
                        list.insert(t?.val ?? 0, at: 0)
                        t = t?.right
                    }
                    ends.append(contentsOf: list)
                    p = p?.right
                }
            } else {
                p = p?.right
            }
        }
        
        return ends
    }
    
    // [94-1] 二叉树的前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return mid
        }
        
        var p = root
        var pred: TreeNode? = nil
        
        while p != nil {
            if p?.left == nil {
                mid.append(p?.val ?? 0)
                p = p?.right
            } else {
                pred = p?.left
                while pred?.right != nil && pred?.right?.val != p?.val {
                    pred = pred?.right
                }
                if pred?.right == nil {
                    pred?.right = p
                    mid.append(p?.val ?? 0)
                    p = p?.left
                } else {
                    pred?.right = nil
                    p = p?.right
                }
            }
        }
        
        return mid
    }
    
    // [94] 二叉树的中序遍历
    var mid = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        // [3] morris
        if root == nil {
            return mid
        }
        var p = root
        var pred: TreeNode? = nil
        while p != nil {
            if p?.left == nil {
                mid.append(p?.val ?? 0)
                p = p?.right
            } else {
                pred = p?.left
                while pred?.right != nil && pred?.right?.val != p?.val {
                    pred = pred?.right
                }
                if pred?.right == nil {
                    pred?.right = p
                    p = p?.left
//                    mid.append(p?.val ?? 0)
                } else {
                    pred?.right = nil
                    mid.append(p?.val ?? 0)
                    p = p?.right
                }
            }
        }
        
        return mid
        
        
        // [2]
//        if root == nil {
//            return mid
//        }
//
//        var p = root
//        var queue = [TreeNode]()
//        while !queue.isEmpty || p != nil {
//            while p != nil {
//                queue.append(p!)
//                p = p?.left
//            }
//
//            if !queue.isEmpty {
//                p = queue.removeLast()
//                mid.append(p?.val ?? 0)
//                p = p?.right
//            }
//        }
//
//        return mid
        
        
        //[3]
//        if root == nil {
//            return mid
//        }
//
//        inorderTraversal(root?.left)
//        mid.append(root?.val ?? 0)
//        inorderTraversal(root?.right)
//
//        return mid
    }
    
//    func help_inorderTraversal(_ root: TreeNode?) {
//
//        help_inorderTraversal(root?.left)
//        mid.append(root?.val ?? 0)
//        help_inorderTraversal(root?.right)
//    }
    
    // [863] 二叉树中所有距离为 K 的结点
//    var parent: [TreeNode: TreeNode?]?
//    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
//
//    }
//
//    func dfs(_ node: TreeNode?, _ par: TreeNode?) {
//
//    }
    
    // [671] 二叉树中第二小的节点
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        // 通过层级遍历
        if root == nil || root?.left == nil {
            return -1
        }
        
        var ans: Int?
        var stack = [TreeNode]()
        stack.append((root?.left)!)
        stack.append((root?.right)!)
        
        while !stack.isEmpty {
            var temp = [TreeNode]()
            for node in stack {
                if node.val == root?.val {
                    if let left = node.left {
                        temp.append(left)
                        temp.append((node.right)!)
                    }
                } else {
                    if ans == nil {
                        ans = node.val
                    } else {
                        ans = min(ans ?? 0, node.val)
                    }
                }
            }
            stack = temp
        }
        
        return ans ?? -1
        //        return findSecond(root)
    }
    
    func findSecond(_ root: TreeNode?) -> Int {
        if root == nil || root?.left == nil {
            return -1
        }
        
        if root?.val == root?.left?.val && root?.val == root?.right?.val {
            if findSecond(root?.left) == -1 {
                return findSecond(root?.right)
            }
            if findSecond(root?.right) == -1 {
                return findSecond(root?.left)
            }
            
            return min(findSecond(root?.left), findSecond(root?.right))
        }
        
        if root?.val == root?.left?.val {
            if findSecond(root?.left) == -1 {
                return findSecond(root?.right)
            }
            return min(root?.right?.val ?? 0, findSecond(root?.left))
        } else {
            if findSecond(root?.right) == -1 {
                return findSecond(root?.left)
            }
            return min(root?.left?.val ?? 0, findSecond(root?.right))
        }
        
//        // 终止条件就是节点或者直接点为空，为什么需要子节点为空 因为不存在第二小啊
//        if root == nil || root?.right == nil {
//            return -1
//        }
//        // 两个节点值相等，则需要递归返回各个节点第二小的
//        if root?.val == root?.left?.val && root?.val == root?.right?.val {
//            // 左子树不满足条件则返回右子树结果
//            if findSecond(root?.left) == -1 {
//                return findSecond(root?.right)
//            }
//            // 右子树不满足条件则返回左子树结果
//            if findSecond(root?.right) == -1 {
//                return findSecond(root?.left)
//            }
//            // 左右子树都返回了较大的数则需要比较两个数，并获取较小的那个数
//            return min(findSecond(root?.left), findSecond(root?.right))
//        }
//
//        // 左右子树不相等
//        if root?.val == root?.left?.val {
//            if findSecond(root?.left) == -1 {
//                return root?.right?.val ?? 0
//            }
//            return min(root?.right?.val ?? 0, findSecond(root?.left))
//        } else {
//            if findSecond(root?.right) == -1 {
//                return root?.left?.val ?? 0
//            }
//            return min(root?.left?.val ?? 0, findSecond(root?.right))
//        }
    }
    
    // [669] 修剪二叉搜索树
    // 个人分析 本质上就是删除掉大于后者小于的点 再保证剩下的点正常
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        if root == nil {
            return root
        }
        
        var p = root
        let target = root?.val ?? 0
        if target < low {
            p = p?.right
            p = trimBST(p, low, high)
        } else if target > high {
            p = p?.left
            p = trimBST(p, low, high)
        } else {
            p?.left = trimBST(p?.left, low, high)
            p?.right = trimBST(p?.right, low, high)
        }
        
        return p
    }
    
    func trimBST_Build(_ root: TreeNode?, _ target: Int) {
        if root == nil {
            return
        }
        
        var pp: TreeNode? = nil
        var p = root
        while p != nil && p?.val != target {
            pp = p
            if p?.val ?? 0 > target {
                p = p?.left
            } else {
                p = p?.right
            }
        }
        
        // can't find target number
        if p == nil {
            return
        }
        
        // if the node that you want to delete has two sonNode
        if p?.left != nil && p?.right != nil {
            var minP = p?.right
            var minPP = p
            
            while minP?.left != nil {
                minP = minP?.left
                minPP = minP
            }
            
            p?.val = minP?.val ?? 0
            
            p = minP
            pp = minPP
        }
        
        var child: TreeNode? = nil
        if p?.left != nil {
            child = p?.left
        } else if p?.right != nil {
            child = p?.right
        } else {
            child = nil
        }
        
        if pp == nil {
            pp = child
        } else if pp?.left?.val == target {
            pp?.left = child
        } else {
            pp?.right = child
        }
    }
    
    // [655] 输出二叉树
    func printTree(_ root: TreeNode?) -> [[String]] {
        let height = getTreeHeight(root)
        
        var list = [[String]].init(repeating: [String].init(repeating: "", count: 1 << height - 1), count: height)
        build_printTree(root, &list, 0, 0, list[0].count)
        
        return list
    }
    
    func build_printTree(_ root: TreeNode?, _ list: inout [[String]], _ row: Int, _ l: Int, _ r: Int) {
        if root == nil {
            return
        }
        let mid = (r + l) / 2
        list[row][mid] = "\(root?.val ?? 0)"
        build_printTree(root?.left, &list, row + 1, l, mid)
        build_printTree(root?.right, &list, row + 1, mid + 1, r)
    }
    
    // 获取最大的树高
    func getTreeHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return 1 + max(getTreeHeight(root?.left), getTreeHeight(root?.right))
    }
}
