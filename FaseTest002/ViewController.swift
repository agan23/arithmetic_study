/**
 * @Name: ViewController.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/2/26
 * @Copyright: 
 */


import UIKit

//static let shareViewVC: UIViewController? = nil

class ViewController: UIViewController {

    @IBOutlet weak var nameL: UITextField! {
        didSet {
            print("change")
        }
    }
    @objc dynamic var nameK: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        shareViewVC = self
        let font = UIFont()
        font.methodSwizze(cls: UIFont.self, originalSelector: #selector(UIFont.changeA), swizzledSelector: #selector(UIFont.changeB))
        font.changeA()
        font.changeB()
        
        let p = Person()
        
//        p .addObserver(self, forKeyPath: "name", options: [.new, .old], context: nil)
//
//        p.name = "ertegter"
        
//        nameL.addObserver(self, forKeyPath: "text", options: [.new, .old], context: nil)
//        nameL.text = "findle"
        
        let op = BlockOperation {
            print(Thread.current)
        }
        op.addExecutionBlock {
            print(Thread.current)
        }
        op.addExecutionBlock {
            print(Thread.current)
        }
        op.start()
        
        let op1 = BlockOperation {
            print(String(format: "%s + op1", Thread.current))
        }
        let op2 = BlockOperation {
            print(String(format: "%x + op2", Thread.current))
        }
        let op3 = BlockOperation {
            print(String(format: "%s + op3", Thread.current))
        }
        op3.addDependency(op2)
        op2.addDependency(op1)
        let mainQueue = OperationQueue()
        mainQueue.addOperation(op1)
        mainQueue.addOperation(op2)
        mainQueue.addOperation(op3)
        mainQueue.addOperation {
            print(String(format: "%s + main", Thread.current))
        }
        
//        table.reloadData()
//        table.scrollToRow(at: IndexPath(row: 19, section: 0), at: UITableView.ScrollPosition.bottom, animated: true)
        
        UserDefaultToolConfig.token = "123123123123123"
        print(UserDefaultToolConfig.token)
        
//        print("=================")
//        let c = DynamicPlan.coinChange(coins: [1, 2, 5], amount: 11)
//        print(c)
        
        Test.test2()
        print("=================")
//        testLock()
        
        print("=================")
//        testAutoClosur(ifPrint: true, message: 1 > 2 ? "3" : "4")
//        serve(customer: "12312312" )
//        dispatchPreconditionTest()
        
//        let addTwo = add(2)(10)
//        print(addTwo)
        print("****************************")
//        twoSum([1, 2, 3, 4], 3)
        let root = TreeNode(3)
        let root1 = TreeNode(9)
        let root2 = TreeNode(20)
        let root4 = TreeNode(15)
        let root5 = TreeNode(7)
        root.left = root1
//        root.right = root2
        root1.left = root4
        root1.right = root5
        
//        let list = lowestCommonAncestorA(root, root2, root5)
        
//        let list = zigzagLevelOrder(root)
//        print(list)
        
//        let r0 = Node(3)
//        let r1 = Node(1)
//        let r2 = Node(2)
//        r0.left = r1
//        r0.right = r2
//        connectA(r0)
        
//        testDfs(1, 32)
        
//        print(reverString(str: "Hello world."))
//        print(reveserWithWidthSpace(str: "Hello world, I come from Japan"))
//        let tree = sortedArrayToBST([-10,-3,0,5,9])
//        print("===================")
//        lastKStr("resfa3esfsdfs", 6)
        
//        testSort()
        
//        let list = constructMaximumBinaryTree([1, 2, 8, 5, 6, 3])
//        print(list)
        
        let objc = Dongtai_study()
        objc.test()
        
//        let s = printTree(root)
//        print(s)
    }
    
    
    
    
    
    
    func build_widthOfBinaryTree(_ root: TreeNode?, _ result: inout Int, _ left: inout [Int: Int], _ dep: Int,  _ pos: Int) {
        if root == nil {
            return
        }
        // ??????????????????
        if !left.keys.contains(dep) {
            left[dep] = pos
        }
        
        result = max(result, pos - (left[dep] ?? 0) + 1)
        build_widthOfBinaryTree(root?.left, &result, &left, dep + 1, 2 * pos)
        build_widthOfBinaryTree(root?.right, &result, &left, dep + 1, 2 * pos + 1)
    }
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        var result = 0
        // ??????????????????
        var left = [Int: Int]()
        build_widthOfBinaryTree(root, &result, &left, 0, 0)
        
        return result
        
        
//        if root == nil {
//            return 0
//        }
//
//        var data = [TreeNode]()
////        var list = root
//        root?.val = 0
//        data.append(root!)
//        var mVal = 0
//
//        while !data.isEmpty {
//            var n = data.count
//            mVal = max(mVal, (data.last?.val ?? 0) - (data.first?.val ?? 0) + 1)
//            while n > 0 {
//                let node = data.removeFirst()
//                if let left = node.left {
//                    left.val = node.val * 2 + 1
//                    data.append(left)
//                }
//                if let right = node.right {
//                    right.val = node.val * 2 + 2
//                    data.append(right)
//                }
//                n -= 1
//            }
//        }
//
//        return mVal
        
//        if root == nil {
//            return 0
//        }
//
//        var queue = [TreeNode]()
//        var mVal = 0
//        queue.append(root!)
//
//        while !queue.isEmpty {
//            var n = queue.count
//            mVal = max(mVal, n)
//
//            var jg = n
//            for j in stride(from: n - 1, through: 0, by: -1) {
//                if queue[j].right != nil || queue[j].left != nil {
//                    break
//                }
//                jg -= 1
//            }
////            var node =  queue.first
//            for i in 0..<jg {
//                let node = queue.removeFirst()
//                if node.left == nil && node.right == nil {
//                    queue.append(TreeNode(0))
//                    queue.append(TreeNode(0))
//                    continue
//                }
//                if node.left != nil {
//                    queue.append(node.left!)
//                }
//                if node.right != nil {
//                    if node.left == nil {
//                        queue.append(TreeNode(0))
//                    }
//                    queue.append(node.right!)
//                }
//            }
//
//            for i in 0..<n - jg {
//                queue.removeFirst()
//            }
//        }
//
//        return mVal
    }
    
    // [283] ????????? ?????????????????? nums?????????????????????????????? 0 ????????????????????????????????????????????????????????????????????? [1, 0, 2, 0, 3]
    func moveZeroes(_ nums: inout [Int]) {
        var pre = 0
        var list = [Int].init(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            if nums[i] != 0 {
                (list[pre], nums[i]) = (nums[i], list[pre])
                pre += 1
            }
        }
    }
    
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        while root != nil {
            let rootVal = root?.val ?? 0
            if rootVal == key {
                if root?.left == nil {
                    return root?.right
                }
                if root?.right == nil {
                    return root?.right
                }
                
                let minNode = getMinNode(root?.right)
                root?.val = minNode?.val ?? 0
                root?.right = deleteNode(root?.right, minNode?.val ?? 0)
                
            } else if rootVal > key {
                root?.left = deleteNode(root?.left, key)
            } else {
                root?.right = deleteNode(root?.right, key)
            }
        }
        
        return root
    }
    
    func getMinNode(_ root: TreeNode?) -> TreeNode? {
        var head = root
        while head?.left != nil {
            head = head?.left
        }
        return head
    }
    
    // ????????????????????????????????????????????? nums ?????????????????????????????????????????? ??????????????? ???????????????
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return build_constructMaximumBinaryTree(nums, 0, hi: nums.count)
    }
    
    func build_constructMaximumBinaryTree(_ nums: [Int], _ low: Int, hi: Int) -> TreeNode? {
        if low >= hi {
            return nil
        }
        
        var maxIndex = low
        var max = nums[low]
        for i in low..<hi {
            if nums[i] > max {
                maxIndex = i
                max = nums[maxIndex]
            }
        }
        
        var root = TreeNode(nums[maxIndex])
        root.left = build_constructMaximumBinaryTree(nums, low, hi: maxIndex)
        root.right = build_constructMaximumBinaryTree(nums, maxIndex + 1, hi: hi)
        
        return root
    }
    
    // ???????????????????????????????????????????????????????????????????????? ??????????????????????????????????????????????????? ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        return pathSum(root?.left, targetSum) + pathSum(root?.right, targetSum) + pathSumAdd(root, targetSum)
    }
    
    func pathSumAdd(_ root: TreeNode?, _ targetSum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var count = 0
        
        if root?.val == targetSum {
            count = 1
        }
        
        count += pathSumAdd(root?.left, targetSum - root!.val)
        count += pathSumAdd(root?.right, targetSum - root!.val)
        
        return count
    }
    
//    ????????????????????????????????????????????????
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var queue = [TreeNode]()
        var sum = 0
        
        queue.append(root!)
//        sum = root?.val ?? 0
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let left = node.left {
                if left.left == nil && left.right == nil {
                    sum += left.val
                } else {
                    queue.append(left)
                }
            }
            
            if let right = node.right {
                queue.append(right)
            }
        }
        
        return sum
    }
    
    // ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????????????????????????????????????????????????????????????????
//    func rob(_ root: TreeNode?) -> Int {
//
//    }
    
    // ???????????????????????????????????????????????????????????????????????????
    func binaryTreePaths(_ root: TreeNode?) -> [String] {

        
        // ??????????????????
        if root == nil {
            return []
        }
        var list = [String]()
        var queue = [TreeNode]()
        var paths = [String]()
        
        queue.append(root!)
        paths.append("\(root?.val ?? 0)")
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            var path = paths.removeFirst()
            if node.left == nil && node.right == nil {
                list.append(path)
            } else {
                if let left = node.left {
                    queue.append(left)
                    path = path + "->" + "\(left.val)"
                    path.append(path)
                }
                if let right = node.right {
                    queue.append(right)
                    path = path + "->" + "\(right.val)"
                    path.append(path)
                }
            }
        }
        
        return paths
        
//        var paths = [String]()
//        var str = ""
//        buildbinaryTreePaths(root, &paths, str)
//        return paths
    }
    
    func buildbinaryTreePaths(_ root: TreeNode?, _ paths: inout [String], _ path: String) {
        var head = root
        if head != nil {
            var pathV = path
            pathV.append("\(head?.val ?? 0)")
            if head?.left == nil && head?.right == nil {
                paths.append(pathV)
            } else {
                pathV += "->"
                buildbinaryTreePaths(root?.left, &paths, pathV)
                buildbinaryTreePaths(root?.right, &paths, pathV)
            }
        }
    }
    
    // ?????????????????????, ?????????????????????????????????????????????????????????
    func lowestCommonAncestorA(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let p1 = get_lowestCommonAncestor(root, p)
        let p2 = get_lowestCommonAncestor(root, q)
        
        // ??????????????????
        var ancestor: TreeNode? = nil
        
        for i in 0..<max(p1.count, p2.count) {
            if p1[i].val == p2[i].val {
                ancestor = p1[i]
            } else {
                break
            }
        }
        
        return ancestor
    }
    
    func get_lowestCommonAncestor(_ root: TreeNode?, _ r: TreeNode?) -> [TreeNode] {
        if root == nil {
            return []
        }
        
        var head = root
        var list = [TreeNode]()
        let rVal = r?.val ?? 0
        
        var temp: TreeNode? = nil
        var pre: TreeNode? = nil
        
        while head?.val != rVal {
            while head != nil {
                list.append(head!)
                if head?.val == rVal {
                    return list
                }
                head = head?.left
            }
            
            head = list.removeLast()
            if pre?.val == head?.val {
                head = list.removeLast()
            }
            temp = head
            head = head?.right
            if head != nil {
                pre = temp
                list.append(temp!)
            }
        }
        
        list.append(head!)
        
        return list
    }
    
    // ???????????????????????????, ?????????????????????????????????????????????????????????
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var rootVal = root?.val ?? 0
        var pVal = p?.val ?? 0
        var qVal = q?.val ?? 0
        
        var head = root
        
        while true {
            if rootVal < pVal && rootVal < qVal {
                head = head?.right
            } else if rootVal > pVal && rootVal > qVal {
                head = head?.left
            } else {
                break
            }
        }
        
        return head
    }
    
    func kthSmallestA(_ root: TreeNode?, _ k: Int) -> Int {
        
        var stack = [TreeNode]()
        
        var header = root
        var index = k
        
        while true {
            while header != nil {
                stack.append(header!)
                header = header?.left
            }
            
            header = stack.removeLast()
            index -= 1
            if index == 0 {
                return header?.val ?? 0
            }
            
            header = header?.right
        }
    }
    
    // ??????????????????????????????????????? root ?????????????????? k ?????????????????????????????????????????? k ????????????????????? 1 ??????????????????
    var res_buildkthSmallest = 0
    var rank_buildkthSmallest = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return -1
        }
        buildkthSmallest(root!, k)

        return res_buildkthSmallest
    }
    
    func buildkthSmallest(_ root: TreeNode, _ k: Int) {
        if let left = root.left {
            buildkthSmallest(left, k)
        }
        rank_buildkthSmallest += 1
        if rank_buildkthSmallest == k {
            res_buildkthSmallest = root.val ?? 0
            return
        }
        if let right = root.right {
            buildkthSmallest(right, k)
        }
    }
    
    // ???????????? ??????????????? ???????????? root ?????????????????????????????????
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = countNodes(root?.left)
        let right = countNodes(root?.right)
        
        return 1 + left + right
        
    }
    
    // ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        if root == nil {
            return []
        }
        
        var dict = [Int: TreeNode]()
        var queue = [TreeNode]()
        var depth = [Int]()
        var maxDepth = -1
        
        queue.append(root!)
        depth.append(0)
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let dep = depth.removeFirst()
            
            maxDepth = max(maxDepth, dep)
            
            if !dict.keys.contains(maxDepth) {
                dict[maxDepth] = node
            }
            
            if let left = root?.left {
                queue.append(left)
            }
            
            if let left = root?.left {
                queue.append(left)
            }
            
            depth.append(dep + 1)
            depth.append(dep + 1)
            
        }
        
        
        var list = [Int]()
        for d in 0..<maxDepth {
            list.append(dict[d]?.val ?? 0)
        }
        
        return list
//        if root == nil {
//            return []
//        }
//
//        var vals = [Int]()
//        var queue = [TreeNode]()
//
//        queue.append(root!)
//
//        while !queue.isEmpty {
//            let n = queue.count
//            for i in 0..<n {
//                let node = queue.removeFirst()
//                if i == n - 1 {
//                    vals.append(node.val)
//                }
//
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
    
    // ???????????? ???????????????????????????????????? ?????? ??????
    var postorderTraversalList = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var queue = [TreeNode]()
        var vals = [Int]()
        
        var node = root
        var pre: TreeNode? = nil
        while !queue.isEmpty || node != nil {
            while node != nil {
                queue.append(node!)
                node = node?.left
            }
            
            node = queue.removeLast()
            
            if node?.right == nil || node?.right?.val == pre?.val  {
                vals.append(node?.val ?? 0)
                pre = node
                node = nil
            } else {
                queue.append(node!)
                node = node?.right
            }
        }
        
        return vals
        
//        if root == nil {
//            return []
//        }
//        buildpostorderTraversal(root!)
//
//        return postorderTraversalList
    }
    
    func buildpostorderTraversal(_ root: TreeNode) {
        if let left = root.left {
            buildpostorderTraversal(left)
        }
        if let right = root.right {
            buildpostorderTraversal(right)
        }
        
        postorderTraversalList.append(root.val)
    }
    
    // ????????????
    var preorderTraversalList = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        return []
        
//        var res = [Int]()
//
//        if root == nil {
//            return res
//        }
//
//        var p1 = root
//        var p2: TreeNode? = nil
//
//        while p1 != nil {
//            p2 = p1?.left
//            if p2 != nil {
//                while p2?.right != nil && p2?.right?.val != p1?.val {
//                    p2 = p2?.right
//                }
//
//                if p2?.right == nil {
//                    <#code#>
//                }
//            } else {
//                res.append(p2?.val ?? 0)
//            }
//        }
        
        
//        if root == nil {
//            return []
//        }
//
//        var queue = [TreeNode]()
//        var list = [Int]()
//
//        var node = root
//        while !queue.isEmpty || node != nil {
//            while node != nil {
//                queue.append(node!)
//                list.append(node?.val ?? 0)
//                node = node?.left
//            }
//
//            node = queue.removeLast()
//            node = node?.right
//        }
//
//        return list
        
//        if root == nil {
//            return []
//        }
//
//        buildpreorderTraversal(root!)
//        return preorderTraversalList
    }
    
    func buildpreorderTraversal(_ root: TreeNode) {
        preorderTraversalList.append(root.val )
        if let left = root.left {
            buildpreorderTraversal(left)
        }
        if let right = root.right {
            buildpreorderTraversal(right)
        }
    }
    
    // ????????????????????????????????? root ??????????????????????????????????????? 0 ??? 9 ??????????????????
//    ???????????????????????????????????????????????????????????????
//    ?????????????????????????????????????????? 1 -> 2 -> 3 ???????????? 123 ???
//    ??????????????????????????????????????? ?????????????????? ???
//    ????????? ?????????????????????????????????
    func sumNumbers(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var queueNode = [TreeNode]()
        var queueVal = [Int]()
        
        var sum = 0
        
        queueNode.append(root!)
        queueVal.append(root?.val ?? 0)
        
        while !queueNode.isEmpty {
            let node = queueNode.removeFirst()
            var num = queueVal.removeFirst()
            
            let left = node.left
            let right = node.right
            
            if left == nil && right == nil {
                sum += num
            } else {
                if left != nil {
                    queueNode.append(left!)
                    queueVal.append(left!.val + num * 10)
                } else if right != nil {
                    queueNode.append(right!)
                    queueVal.append(right!.val + num * 10)
                }
            }
        }
        
        return sum
        
//        if root == nil {
//            return 0
//        }
//
//        return sumNumbers(root, preValue: 0)
    }
    
    func sumNumbers(_ root: TreeNode?, preValue val: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var value = val + (root?.val ?? 0)
        
        if root?.left == nil && root?.right == nil {
            return value
        }
        
        let left = sumNumbers(root?.left, preValue: value * 10)
        let right = sumNumbers(root?.right, preValue: value * 10)
        
        return left + right
    }
    
    // ?????? ????????????????????????????????????????????????????????????-??????????????????????????????????????????????????????????????????????????????????????? ?????????????????? ???????????? ?????????????????? ???????????????????????????????????????
    var maxValue = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxGain(root)
        
        return maxValue
    }
    
    func maxGain(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = max(maxGain(root?.left), 0)
        let right = max(maxGain(root?.right), 0)
        
        var prince = left + right + (root?.val ?? 0)
        maxValue = max(maxValue, prince)
        
        return (root?.val ?? 0) + max(left, right)
    }
    
    // ?????????????????? next ?????????????????????????????????????????????????????????????????????????????????????????????????????? next ??????????????? NULL???
    func connectA(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var queue = [Node]()
        queue.append(root!)
        while !queue.isEmpty {
            let n = queue.count
            var last: Node? = nil
            for i in 0..<n {
                let f = queue.removeFirst()
                if let left = f.left {
                    queue.append(left)
                }
                if let right = f.right {
                    queue.append(right)
                }
                if i != 0 {
                    last?.next = f
                }
                last = f
                print("A")
            }
        }
        
        return root
    }
    
    func connect(_ root: Node?) -> Node? {
        if root == nil {
            return nil
        }
        
        var leftMost = root
        
        while leftMost?.left != nil {
            var head = leftMost
            while head != nil {
                head?.left?.next = head?.right
                if head?.next != nil {
                    head?.right?.next = head?.next?.left
                }
                head = head?.next
            }
            leftMost = leftMost?.left
        }
        
        return root
        
//        if root == nil {
//            return nil
//        }
//
//        var levels = [Node]()
//        levels.append(root!)
//
//        while !levels.isEmpty {
//            let count = levels.count
//            for i in 0..<count {
//                let node = levels.removeFirst()
//
//                if i < count - 1 {
//                    node.next = levels.first
//                }
//
//                if let left = node.left {
//                    levels.append(left)
//                }
//
//                if let right = node.right {
//                    levels.append(right)
//                }
//            }
//        }
//
//        return root
        
        
//        if root == nil {
//            return nil
//        }
//
//        let left = root?.left
//        let right = root?.right
//
//        buildConnect(left, right)
//
//        return root
    }
    
    func buildConnect(_ r1: Node?, _ r2: Node?) {
        if r1 == nil || r2 == nil {
            return
        }
        
        r1?.next = r2
        buildConnect(r1?.left, r1?.right)
        buildConnect(r2?.left, r2?.right)
        buildConnect(r1?.right, r2?.left)
    }
    
    // ??????????????????????????? root ??????????????????????????????????????????
    func flatten(_ root: TreeNode?) {
        var cur = root
        
        while cur != nil {
            if cur?.left != nil {
                var next = cur?.left
                var pre = next
                while pre?.right != nil {
                    pre = pre?.right
                }
                
                pre?.right = cur?.right
                cur?.left = nil
                cur?.right = next
            }
            cur = cur?.right
        }
        
        print(root)
        
        // ??????????????????
//        if root == nil {
//            return
//        }
//
//        flatten(root?.left)
//        flatten(root?.right)
//
//        let left = root?.left
//        let right = root?.right
//
//        // ??????????????????????????? ???????????????????????????????????????????????????????????????
//        if left == nil && right == nil {
//            return
//        }
//
//        root?.left = nil
//        root?.right = left
//
//        var treeNode = root
//        while treeNode?.right != nil {
//            treeNode = treeNode?.right
//        }
//
//        treeNode?.right = right
    }
    
    
    // ??????????????????????????? root ???????????????????????? targetSum ??????????????? ??????????????????????????? ?????????????????????????????????????????????
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        var list = [Int]()
        dfsPathSum(root, target: targetSum, addSum: 0, list: &list, result: &result)
        
        return result
    }
    
    func dfsPathSum(_ root: TreeNode?, target sum: Int, addSum total: Int, list: inout [Int], result: inout [[Int]]) {
        if root == nil {
            return
        }
        
        var totalV = total
        
        // ????????????????????????list???
        list.append(root?.val ?? 0)
        totalV += (root?.val ?? 0)
        
        if root?.left == nil && root?.right == nil {
            if sum == total {
                result.append(list)
            }
            
            list.removeLast()
            
            return
        }
        
        if let left = root?.left {
            dfsPathSum(left, target: sum, addSum: totalV, list: &list, result: &result)
        }
        if let right = root?.right {
            dfsPathSum(right, target: sum, addSum: totalV, list: &list, result: &result)
        }
        
        list.removeLast()
    }
    
    //    var pathList = [[Int]]()
//    var path = [Int]()
//    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
//        buildPathSum(root, num: targetSum)
//        return pathList
//    }
//
//    func buildPathSum(_ root: TreeNode?, num: Int) {
//        if root == nil {
//            return
//        }
//        var numM = num
//
//        path.append(root?.val ?? 0)
//        numM -= (root?.val ?? 0)
//        if root?.left == nil && root?.right == nil && numM == 0 {
//            pathList.append(path)
//        }
//
//        if let left = root?.left {
//            buildPathSum(left, num: numM)
//        }
//        if let right = root?.right {
//            buildPathSum(right, num: numM)
//        }
//
//        path.removeLast()
//
//    }
    
    
    // ??????????????????????????? root ????????????????????????????????? targetSum ?????????????????????????????? ???????????????????????? ??????????????????????????????????????????????????????????????? targetSum ???
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        
        var queueNodes = [TreeNode]()
        var queueVals = [Int]()
        
        queueNodes.append(root!)
        queueVals.append(root?.val ?? 0)
        
        while !queueNodes.isEmpty {
            let node = queueNodes.removeFirst()
            var temp = queueVals.removeFirst()
            if node.left == nil && node.right == nil {
                if temp == targetSum {
                    return true
                }
                continue
            }
            
            if let left = node.left {
                queueNodes.append(left)
                queueVals.append(temp + left.val)
            }
            
            if let right = node.right {
                queueNodes.append(right)
                queueVals.append(temp + right.val)
            }
            
            
        }
        
        return false
        
        
//        if root == nil {
//            return false
//        }
//
//        if root?.left == nil && root?.right == nil {
//            return targetSum == root?.val
//        }
//
//        return hasPathSum(root?.left, targetSum - (root?.val ?? 0)) || hasPathSum(root?.right, targetSum - (root?.val ?? 0))
    }
    
    // ?????????????????????????????????????????????
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        if root?.left != nil && root?.right != nil {
            return 1
        }
        
        var minI = Int.max
        
        if let left = root?.left {
            minI = min(minI, minDepth(left))
        }
        if let right = root?.right {
            minI = min(minI, minDepth(right))
        }
        
        return minI + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return buildBalanced(root) >= 0
    }
    
    func buildBalanced(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let left = buildBalanced(root?.left)
        let right = buildBalanced(root?.right)
        
        if left == -1 || right == -1 || abs(left - right) > 1 {
            return -1
        } else {
            return max(left, right) + 1
        }
    }
//        if root == nil {
//            return true
//        }
//
//        return abs(buildBalanced(root?.left) - buildBalanced(root?.right)) <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
//    }
//
//    func buildBalanced(_ root: TreeNode?) -> Int {
//        if root == nil {
//            return 0
//        } else {
//            return max(buildBalanced(root?.left), buildBalanced(root?.right)) + 1
//        }
//    }
    
    
    func testSort() {
        var lsit = [2, 4, 1, 5, 7]
//        let ll = lsit.bubbleSort()
        
        let ll = kuaisupaixu(&lsit)
        print(ll)
    }
    
    // ????????????
    func insertSort(_ nums: inout [Int]) {
        if nums.count < 1 {
            return
        }
        
        let count = nums.count
        
//        for i in 1..<count {
//            var value = nums[i]
//            var j = i - 1
//            while j >= 0 {
//                if nums[j] > value {
//                    nums[j + 1] = nums[j]
//                } else {
//                    break
//                }
//                j -= 1
//            }
//
//            nums[j + 1] = value
//        }
        
        for i in 1..<count {
            let value = nums[i]
            var j = i - 1
            while j >= 0 {
                if nums[j] > value {
                    nums[j + 1] = nums[j]
                } else {
                    break
                }
                j -= 1
            }
            nums[j + 1] = value
        }
        
        // 2 3 1 ????????????????????????  ????????????????????????  ???????????????
//        for i in 1..<count {
//            var value = nums[i]
//            var preIndex = i - 1
//            while preIndex >= 0 && value < nums[preIndex] {
//                nums[preIndex + 1] = nums[preIndex]
//                preIndex -= 1
//            }
//            nums[preIndex] = value
//        }
    }
    
    // ????????????
    func bubbleSort(_ nums: inout [Int]) {
        if nums.count == 0 {
            return
        }
        
        for i in 0..<nums.count {
            for j in 0..<(nums.count - i - 1) {
                if nums[j] > nums[j + 1] {
                    (nums[j], nums[j + 1]) = (nums[j + 1], nums[j])
                }
            }
        }
    }
    
    // ????????????
    func kuaisupaixu(_ nums: inout [Int]) {
        quickSort(&nums, p: 0, r: nums.count - 1)
    }
    
    func quickSort(_ nums: inout [Int], p: Int, r: Int) {
        if p >= r {
            return
        }
        
        let q = partition(&nums, p: p, r: r)
        quickSort(&nums, p: p, r: q - 1)
        quickSort(&nums, p: q + 1, r: r)
    }
     
    func partition(_ nums: inout [Int], p: Int, r: Int) -> Int {
        // ??????????????????
        var pivot = nums[r]
        
        var i = p
        
        // ???p-r?????????????????????
        for j in p..<r {
            // ???????????????????????????????????????i   ?????????????????????????????????
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
        
        print(i)
        
        return i
    }
    
    // ????????????
    func guibingPaixu(_ nums: inout [Int]) {
        let count = nums.count
        // ??????????????????1 ???????????????
        if count <= 1 {
            return
        }
        
        mergeSort(&nums, from: 0, end: count - 1)
    }
    
    func mergeSort(_ nums: inout [Int], from: Int, end: Int) {
        if from >= end {
            return
        }
        
        // ??????????????? ???????????????????????????
        let q = (from + end) / 2
        mergeSort(&nums, from: from, end: q)
        mergeSort(&nums, from: q + 1, end: end)
        
        // ????????????????????????
        merge(&nums, p: from, q: q, r: end)
        
//        merge(<#T##nums: &[Int]##[Int]#>, from: <#T##Int#>, end: <#T##Int#>)
    }
    
    func merge(_ nums: inout [Int], p: Int, q: Int, r: Int) {
        
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
        
        // ?????????????????????
        var start = i
        var end = q
        if j <= r {
            start = j
            end = r
        }
        
        // ????????????copy??????????????????
        while start <= end {
            temp[k] = nums[start]
            k += 1
            start += 1
        }
        
        // ???tmp copy???num???
        for i in 0...(r - p) {
            nums[p + i] = temp[i]
        }
        
    }
    
    // ????????????
    func selectSort(_ nums: inout [Int]) {
        let count = nums.count
        if count < 1 {
            return
        }
        
//        for i in 0..<count {
//            var minIndex = i
//            for j in (i + 1)..<count {
//                if nums[minIndex] > nums[j] {
//                    minIndex = j
//                }
//            }
//            (nums[i], nums[minIndex]) = (nums[minIndex], nums[i])
//        }
        
        
        for i in 0..<count {
            var minIndex = i
            var flag = false
            for j in (i+1)..<count {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                    flag = true
                }
            }
            if flag {
                (nums[i], nums[minIndex]) = (nums[minIndex], nums[i])
            }
            
        }
    }
    
    
    // ????????????????????????????????????????????????????????????
    // ??????????????????????????????????????????????????????????????? true ?????????????????????????????????????????????????????? false ???
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            } else {
                set.insert(num)
            }
        }
        
        return false
    }
    
    func creataeBigButton() {
        let btn = LeeButton(frame: CGRect(x: 20, y: 40, width: 100, height: 30))
        btn.backgroundColor = UIColor.red
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(clickBtnFunc), for: UIControl.Event.touchUpInside)
        
        
        print(btn.frame)
    }
    
    
    @objc func clickBtnFunc(btn: LeeButton) {
        print(#function)
        print(btn.frame)
    }
    
    // ????????????????????????????????????k?????????
    func lastKStr(_ orgStr: String, _ k: Int) -> String? {
        if orgStr.count < k {
            return nil
        }
        
        var arr = Array(orgStr)
        let length = arr.count
        
        let rang: ClosedRange = 0...length-k
        let a1 = orgStr.startIndex
        let a2 = orgStr.starts(with: "123")
        let a3 = orgStr.starts(with: "42342") { (a, b) -> Bool in
            print(a)
            print(b)
            return true
        }
        let a4 = orgStr.suffix(10)
        return nil
//        orgStr.enumerateSubstrings(in: <#T##RangeExpression#>, <#T##body: (String?, Range<String.Index>, Range<String.Index>, inout Bool) -> Void##(String?, Range<String.Index>, Range<String.Index>, inout Bool) -> Void#>)
//        Range(NSRange(RangeExpression, in: <#T##StringProtocol#>), in: <#T##String#>)
    }
    
    
    // ???????????????????????? nums ???????????????????????? ?????? ???????????????????????????????????? ???????????? ??????????????????
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        // ??????????????????????????????????????????????????????????????????????????????
        return sortedArrayToBSTDetail(nums, start: 0, end: nums.count - 1)
    }
    
    func sortedArrayToBSTDetail(_ nums: [Int], start: Int, end: Int) -> TreeNode? {
        // ??????????????????????????????????????????????????????????????????????????????
        if start > end {
            return nil
        }
        
        var mid = (end + start) / 2
        var rootValue = nums[mid]
        var root = TreeNode(rootValue)
        root.left = sortedArrayToBSTDetail(nums, start: start, end: mid - 1)
        root.right = sortedArrayToBSTDetail(nums, start: mid + 1, end: end)
        
        return root
    }
    
    // ???????????????????????????????????????????????????????????????????????? ???????????????????????????????????????????????????????????????????????????????????????
    // ??????????????? [3,9,20,null,null,15,7],
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [[]]
        }
        
        var list = [[Int]]()
        var level = [TreeNode]()
        level.append(root!)
        
        while !level.isEmpty {
            var size = level.count
            var data = [Int]()
            while size > 0 {
                let node = level.removeFirst()
                data.append(node.val)
                
                if let left = node.left {
                    level.append(left)
                }
                if let right = node.right {
                    level.append(right)
                }
                size -= 1
            }
            list.insert(data, at: 0)
        }
        return list
    }
    
    // ???????????? preorder = [3,9,20,15,7]  ???????????? inorder = [9,3,15,20,7]
    var buildTreeDict = [Int: Int]()
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        for i in 0..<inorder.count {
            buildTreeDict[inorder[i]] = i
        }
        return buildTreeDetail(preorder, pStart: 0, pEnd: preorder.count - 1, inorder, iStart: 0, iEnd: inorder.count - 1)
    }
    
    // ???????????? inorder = [9,3,15,20,7]   ???????????? postorder = [9,15,7,20,3]
    func buildTreeA(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for i in 0..<inorder.count {
            buildTreeDict[inorder[i]] = i
        }
        return buildTreeDetailA(postorder, postStart: 0, postEnd: postorder.count - 1, inorder, iStart: 0, iEnd: inorder.count - 1)
    }
    
    func buildTreeDetailA(_ postorder: [Int], postStart: Int, postEnd: Int, _ inorder: [Int], iStart: Int, iEnd: Int) -> TreeNode? {
        if iStart > iEnd {
            return nil
        }
        
        let rootValue = postorder[postEnd]
        let index = buildTreeDict[rootValue] ?? 0
        
        let leftSize = index - iStart
        
        let root = TreeNode(rootValue)
        root.left = buildTreeDetailA(postorder, postStart: postStart, postEnd: postStart + leftSize - 1, inorder, iStart: iStart, iEnd: index - 1)
        root.right = buildTreeDetailA(postorder, postStart: postStart + leftSize, postEnd: postEnd - 1, inorder, iStart: index + 1, iEnd: iEnd)
        
        return root
        
    }
    
    func buildTreeDetail(_ preorder: [Int], pStart: Int, pEnd: Int, _ inorder: [Int], iStart: Int, iEnd: Int) -> TreeNode? {
        if pStart > pEnd {
            return nil
        }
        
        
        let rootValue = preorder[pStart]
//        for i in iStart...iEnd {
//            if rootValue == inorder[i] {
//                index = i
//                break
//            }
//        }
        var index = buildTreeDict[rootValue] ?? 0
        
        let leftSize = index - iStart
        let root = TreeNode(rootValue)
        root.left = buildTreeDetail(preorder, pStart: pStart + 1, pEnd: pStart + leftSize, inorder, iStart: iStart, iEnd: index - 1)
        root.right = buildTreeDetail(preorder, pStart: pStart + leftSize + 1, pEnd: pEnd, inorder, iStart: index + 1, iEnd: iEnd)
        
        return root
    }
    
    // ????????????
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var deep = 0
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                size -= 1
            }
            
            deep += 1
        }
        
        return deep
        
//        if root == nil {
//            return 0
//        }
//
//        let left = maxDepth(root?.left)
//        let right = maxDepth(root?.right)
//
//        return max(left, right) + 1
    }
    
    //???????????????????????????
    func reveserWithWidthSpace(str: String ) -> String {
        var arr = str.components(separatedBy: " ")
        var count = arr.count
        for i in 0..<(count / 2) {
            arr.swapAt(i, count - i - 1)
        }
        var last: String = ""
        for s in arr {
            last += s
            last += " "
        }
        last.trimmingCharacters(in: CharacterSet.whitespaces)
        
        return last
    }
    
    // ???????????????
    func reverString(str: String) -> String {
        if str.count == 1 || str.count == 0 {
            return str
        }
        
        var arr = Array(str)
        let count = arr.count
        for i in 0..<(arr.count / 2) {
            arr.swapAt(i, count - i - 1)
        }
        
        return String(arr)
    }
    
    // N ????????????
    var qRow = 0
    func solveNQueens(_ n: Int) -> [[String]] {
        var solutions = [[String]]()
        
//        if qRow == n {
            return [[]]
//        }
//
//        for i in 0..<n {
//            <#code#>
//        }
        
        
//        var solutions = [[String]]()
//        let queens = [Int].init(repeating: -1, count: n)
//        let columns = Set<Int>()
//        let diagonals1 = Set<Int>()
//        let diagonals2 = Set<Int>()
//
//        backtrack(solutions: &solutions, queues: queens, n: n, row: 0, columns: columns, diagonals1: diagonals1, diagonals2: diagonals2)
//
//        return solutions
    }
    
//    func isOkRowColumn(row: Int, col: Int) -> Bool {
//        var leftUp = col - 1
//        var rightUp = col + 1
//        var first = row - 1
//        for i in stride(from: first, to: 0, by: -1) {
//            <#code#>
//        }
//
//
//    }
    
    func backtrack(solutions: inout [[String]], queues: [Int], n: Int, row: Int, columns: Set<Int>, diagonals1: Set<Int>, diagonals2: Set<Int>) {
        var q0 = queues
        var c0 = columns
        var d1 = diagonals1
        var d2 = diagonals2
        if row == n {
            let board = generateBoard(queues: queues, n: n)
            solutions.append(board)
        } else {
            for i in 0..<n {
                if c0.contains(i) {
                    continue
                }
                
                let diagonal1 = row - i
                if d1.contains(diagonal1) {
                    continue
                }
                let diagonal2 = row + i
                if d2.contains(diagonal2) {
                    continue
                }
                
                q0[row] = i
                c0.insert(i)
                d1.insert(diagonal1)
                d2.insert(diagonal2)
                backtrack(solutions: &solutions, queues: q0, n: n, row: row + 1, columns: c0, diagonals1: d1, diagonals2: d2)
                q0[row] = -1
                c0.remove(i)
                d1.remove(diagonal1)
                d2.remove(diagonal2)
            }
        }
        
    }
    
    func generateBoard(queues: [Int], n: Int) -> [String] {
        var board = [String]()
        for i in 0..<n {
            var row = [Character](repeating: ".", count: n)
            row[queues[i]] = "Q"
            board.append(String(row))
        }
        
        return board
    }
    
    
    //////////Test
    func testIs() {
        let p = Person()
        
//        if p.isKind(of: NSObject.self) {
//            print("p is kind of NSObject")
//        }
//
//        if p.isMember(of: Person.self) {
//            print("p is isMember of NSObject")
//        }
        
//        let list = [1, 2, 4, 3]
//        if p.isKind(of: Array<Any>) {
//            print("p is kind of array")
//        }
        
        testDfs(1, 32)
    }
    
//    ??????????????????X XX??????????????????????????????????????????A AA???
//
//    ??????????????????X?????????
//    ?????????????????????0???1????????????????????? ?????? X=2???A=10???
    func testDfs(_ start: Int, _ target: Int) {
        if start % target == 0 {
            print(start)
            return
        }
        
        testDfs(10 * start, target)
        testDfs(10 * start + 1, target)
    }
    
    
    /// ?????????
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let x = root else {
            return []
        }
        
        var level = [TreeNode]()
        var data = [[Int]]()
        level.append(x)
        
        var bFlag = true

        while !level.isEmpty {
            var list = [Int]()
            let size = level.count
            
            var node: TreeNode? = nil
            for _ in 0..<size {
                node = level.removeFirst()
                if bFlag {
                    list.append(node?.val ?? 0)
                } else {
                    list.insert(node?.val ?? 0, at: 0)
                }

                if let left = node?.left {
                    level.append(left)
                }
                if let right = node?.right {
                    level.append(right )
                }
            }

            bFlag = !bFlag
            data.append(list)
        }

        return data
    }
    
    //  ????????????
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let x = root else {
            return []
        }
        
        var data = [[Int]]()
        dfslevelOrder(1, root: x, list: &data)
        
        return data
        
        // bfs
//        guard let x = root else {
//            return []
//        }
//
//        var data = [[Int]]()
//        var level = [TreeNode]()
//        level.append(x)
//
//        while !level.isEmpty {
//            var list = [Int]()
//            let size = level.count
//            for i in 0..<size {
//                let node = level.removeFirst()
//                list.append(node.val ?? 0)
//
//                if let left = node.left {
//                    level.append(left)
//                }
//                if let right = node.right {
//                    level.append(right )
//                }
//            }
//
//            data.append(list)
//        }
//
//        return data
    }
    
    func dfslevelOrder(_ index: Int, root: TreeNode, list: inout [[Int]]) {

        if list.count < index {
            list.append([])
            list[index - 1] = [Int]()
        }
        
        list[index-1].append(root.val)
        if let left = root.left {
            dfslevelOrder(index + 1, root: left, list: &list)
        }
        
        if let right = root.right {
            dfslevelOrder(index + 1, root: right, list: &list)
        }
    }
    
    /// ???????????????
    func isSymmetric(_ root: TreeNode?) -> Bool {
        //
        
        
        if root == nil {
            return true
        }
        
        return isSymmetricBuildA(root?.left, root?.right)

//        return isSymmetricBuild(root?.left, root?.right)
    }
    
    func isSymmetricBuildA(_ r1: TreeNode?, _ r2: TreeNode?) -> Bool {
        var data = [TreeNode]()
        
        if r1 == nil && r2 == nil {
            return true
        }
        
        if r1 == nil || r2 == nil {
            return false
        }
        
        var x1 = r1
        var x2 = r2
        
        data.append(r1!)
        data.append(r2!)
        var nilNode = TreeNode(Int.max)
        
        while !data.isEmpty {
            x1 = data.removeLast()
            x2 = data.removeLast()
            
            if x1?.val == nilNode.val && x2?.val == nilNode.val {
                continue
            }
            
            if x1?.val == nilNode.val && x2?.val == nilNode.val || x1?.val != x2?.val {
                return false
            }
            
            data.append(x1?.left ?? nilNode)
            data.append(x2?.right ?? nilNode)
            data.append(x1?.right ?? nilNode)
            data.append(x2?.left ?? nilNode)
        }
        
        return true
    }
    
    func isSymmetricBuild(_ r1: TreeNode?, _ r2: TreeNode?) -> Bool {
        if r1 == nil && r2 == nil {
            return true
        }
        
        if r1?.val != r2?.val {
            return false
        }
        
        return isSymmetricBuild(r1?.left, r2?.right) && isSymmetricBuild(r1?.right, r2?.left)
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        var data = [TreeNode]()
        
        data.append(p!)
        data.append(q!)
        
        let nilNode = TreeNode(Int.min)
        
        while !data.isEmpty {
            let left = data.removeLast()
            let right = data.removeFirst()
            
            if left.val == nilNode.val && right.val == nilNode.val {
                continue
            }
            
            if left.val == nilNode.val || right.val == nilNode.val || (left.val) != (right.val) {
                return false
            }
            
            data.append(left.left ?? nilNode)
            data.append(right.left ?? nilNode)
            data.append(left.right ?? nilNode)
            data.append(right.right ?? nilNode)
        }
        
        return true
        
//        if p == nil && q == nil {
//            return true
//        }
//
//        if p == nil && q != nil {
//            return false
//        }
//
//        if p != nil && q == nil {
//            return false
//        }
//
//        if p?.val != q?.val {
//            return false
//        }
//
//        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        // ????????????????????????
        
        var max = Int.min
        var stackList = [TreeNode]()
        var x = root
        
        while !stackList.isEmpty || x != nil {
            while x != nil {
                stackList.append(x!)
                x = x?.left
            }
            
            x = stackList.removeLast()
            if (x?.val ?? 0) <= max {
                return false
            }
            
            max = x?.val ?? 0
            x = x?.right
        }
        
        return true
        
        
        // ????????????
//        if root == nil {
//            return true
//        }
//
//        return build(root, nil, nil)
    }
    
    func build(_ x: TreeNode?, _ min: TreeNode?, _ max: TreeNode?) -> Bool {
        if x == nil {
            return true
        }
        
        if min != nil && (x?.val ?? 0) <= (min?.val ?? 0) {
            return false
        }
        if max != nil && (x?.val ?? 0) >= (max?.val ?? 0) {
            return false
        }
        
        return build(x?.left, min, x) && build(x?.right, x, max)
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        var l = root?.left
        var r = root?.right
        
        let temp = l
        l = r
        r = temp
        
        root?.right = invertTree(root?.left)
        root?.left = invertTree(root?.right)
        
        return root
    }
    
    var mid = [Int]()
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            return mid
//            var pred: TreeNode? = nil
//
//            var x = root
//
//            while x != nil {
//                // ?????? xx ????????????????????? xx ???????????????????????????????????? xx ?????????????????? x = x.\textit{right}x=x.right???
//                if x?.left == nil {
//                    mid.append(x?.val ?? 0)
//                    x = x?.right
//                } else {
//                    // predecessor ?????????????????? root ???????????????????????????????????????????????????????????????
//                    pred = x?.left
//                    // ????????????????????????????????????????????????x ?????????????????????????????????
//                    while pred?.right != nil && pred?.right != x {
//                        pred = pred?.right
//                    }
//
//                    if pred?.right == nil {
//                        pred?.right = x
//                        x = x?.left
//                    } else {
//                        mid.append(x?.val ?? 0)
//                        pred?.right = nil
//                        x = x?.right
//                    }
//                }
//            }
//
//            return mid
            
//        var stackList = [TreeNode]()
//         var head = root
//
//        while head != nil || stackList.count != 0 {
//            while head != nil {
//                stackList.append(head!)
//                head = head?.left
//            }
//
//            head = stackList.removeLast()
//            mid.append(head?.val ?? 0)
//            head = head?.right
//        }
//
//        return mid

        // ????????????
        // inorderTraversal(root.left)
        // mid.append(root.val)
        // inorderTraversal(root.right)

        // return mid
    }
    
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var list = [Int]()
        var bFlag = true
        
        if nums.count < 2 {
            return []
        }
//        nums.removeLast()
//        nums.popLast()
//        var first = nums[0]
//        var ii = 0, jj = 0
//        for i in 1..<nums.count {
//            if target == first + nums[i] {
//                return []
//            }
//        }
        
        
        for i in 0..<nums.count {
            for j in 1..<nums.count {
                if i == j {
                    continue
                }
                let add = nums[i] + nums[j]
                if target == add {
                    list.append(i)
                    list.append(j)
                    bFlag = false
                    break
                }
            }
            if !bFlag {
                break
            }
        }

        return list
    }
    
    func gcdTest1() {
        let queue = DispatchQueue.global()
        let semaphore = DispatchSemaphore(value: 1)
        for i in 0...100 {
            semaphore.wait(timeout: DispatchTime.distantFuture)
            queue.async {
                print(i)
                semaphore.signal()
            }
        }
        
//        let group1 = DispatchGroup()
//        let group2 = DispatchGroup()
//
//        let gQ = DispatchQueue.global()
//
//        group1.enter()
//        let item = DispatchWorkItem {
//            Thread.sleep(forTimeInterval: 2)
//            print(1)
//            group1.leave()
//        }
//        group2.enter()
//        let item1 = DispatchWorkItem {
//            Thread.sleep(forTimeInterval: 2)
//            print(2)
//            group2.leave()
//        }
//
//        gQ.async(group: group1, execute: item)
//        gQ.async(group: group2, execute: item1)
    }
    
    func flatTest() {
        // public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
        [1, 2, 3].map { $0 * 2 }
//        [1, 2, 3].map { (i) -> Int in
//
//        }
        [1.0, 2.2, 3.3].map { (u) -> Double in
            u * 1.1
        }
//        ["12", "43", nil, "54"].map { (str) -> Int in
//            str.count
//        }
        
        ["12", "43", nil, "54"].flatMap { $0?.count }
        ["12", "43", nil, "54"].compactMap { $0?.count }
        
//        let list = [[1, 3], [2, 4]].flatMap { (i) -> [Int] in
//            return i * 2
//        }
        
        
        let arr = ["12", "43", nil, "54"].filter { $0?.count ?? 0 > 0 }
        
        
        for l in arr {
            print(l)
        }
        
//        arr.reduce("", { ($0.count ?? 0) + ($1?.count ?? 0) })
    }
    
    func add(_ num: Int) -> (Int) -> Int {
        return { val in
            return val + num
        }
    }
    
    func dispatchPreconditionTest() {
        let q = DispatchQueue.init(label: "", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        q.async {
            print(Thread.current)
            dispatchPrecondition(condition: DispatchPredicate.onQueue(.main))
//            dispatchPrecondition(condition: .onQueue(.main))
            print(Thread.current)
        }
    }
    
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    
    
    func testAutoClosur(ifPrint: Bool, message: @autoclosure () -> String) {
        print(message())
    }
    
    func testLock() {
        let queue1 = DispatchQueue(label: "com.se")
        queue1.async {
            print(Thread.current)
            queue1.async(flags: DispatchWorkItemFlags.barrier) { () -> Void in
                print(Thread.current)
                print(1)
            }
//            queue1.sync(flags: <#T##DispatchWorkItemFlags#>, execute: <#T##() throws -> T#>)
//            queue1.sync {
//                print(1)
//            }
        }
        print(2)
    }
    
    /// ???????????????
    func changeMutableArray() {
        print("=================")
        var arr = [Int]()
        let queue1 = DispatchQueue.global()
        
        let semophone = DispatchSemaphore(value: 1)
        
        for i in 0...100 {
            queue1.async() { () -> Void in
                semophone.wait(timeout: DispatchTime.distantFuture)
                print("task2 - \(i)")
                arr.append(i)
                print("\(arr)")
                semophone.signal()
            }
        }
    }
    
    func gcdTest() {
        print("=================")
        let sQueue = DispatchQueue(label: "com.hello")
        let workItem = DispatchWorkItem {
            print("1", Thread.current)
        }
        
        sQueue.async(execute: workItem)
        sQueue.async(execute: workItem)
        sQueue.async(execute: workItem)
        sQueue.async(execute: workItem)
        
//        print("=================")
//        let queue = DispatchQueue.global()
//        let queueQ = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
//        queue.sync {
//            print(1, Thread.current)
//        }
//        queueQ.async {
//            print(2, Thread.current)
//        }
//
//        let sQueue = DispatchQueue(label: "hello")
//        sQueue.sync {
//            print(3, Thread.current)
//        }
//        dispatch_
//        sQueue.async {
//            print(4, Thread.current)
//            sQueue.sync {
//                print(5, Thread.current)
//            }
//        }
        
        
        
//        self.perform(#selector(self.pri), with: nil, afterDelay: 1.0)
//        let queue = DispatchQueue(label: "serial")
//        let queue = DispatchQueue(label: "Hello")
//        let queue = DispatchQueue(label: "work", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes, autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>, target: <#T##DispatchQueue?#>)
//        let queue = DispatchQueue.init(label: "", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//        queue.async {
//            print(Thread.current)
//            print(1)
////            self.perform(#selector(self.pri), with: nil, afterDelay: 1.0)
////            self.perform(#selector(self.pri))
////            RunLoop.current.run()
//            queue.sync {
//                print(2)
//            }
//            print(3)
//        }
////        queue.sync {
////            print(Thread.current)
////            print(2)
////        }
//        print(4)
    }

    @objc func pri() {
        print(5)
    }
    
    
    lazy var table: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        view.addSubview(t)
        t.frame = view.bounds
        t.estimatedRowHeight = 100
        t.separatorStyle = .none
        t.register(UINib.init(nibName: "OtherCell", bundle: nil), forCellReuseIdentifier: "OtherCell")
        return t
    }()


    override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if let old = change?[NSKeyValueChangeKey.oldKey] {
//            print(old)
//        }
//        if let new = change?[NSKeyValueChangeKey.newKey] {
//            print(new)
//        }
        
        
    }
}

extension Array where Element: Comparable {
    public mutating func bubbleSort() {
        let count = self.count
        for i in 0..<count {
            for j in 0..<(count - i - 1) {
                if self[j] == self[j + 1] {
                    (self[j], self[j + 1]) = (self[j + 1], self[j])
                }
            }
        }
        print(self)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherCell") as! OtherCell
        cell.contentL.text = "imageName:????????????????????????Assets.car????????????,??????????????????(mainBundle)????????????????????????????????????imageNamed:???Images.xcassets???????????????????????????????????????????????????????????????????????????"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
}
