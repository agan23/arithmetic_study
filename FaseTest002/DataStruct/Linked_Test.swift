/**
 * @Name: Linked_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/16
 * @Copyright: 
 */


import UIKit

class Linked_Test: NSObject {
    func test() {
        let l11 = ListNode(0)
        let l12 = ListNode(2)
        let l13 = ListNode(3)
        let l14 = ListNode(4)
        let l15 = ListNode(5)
//        let l16 = ListNode(6)
        l11.next = l12
        l12.next = l13
        l13.next = l14
        l14.next = l15
//        l15.next = l16
        
        let l21 = ListNode(1)
        let l22 = ListNode(2)
        let l23 = ListNode(3)
        l21.next = l22
        l22.next = l23
        
        let list = isToeplitzMatrix([[1, 2, 3, 4], [5, 1, 2, 3], [9, 5, 1, 2]])
        
        // test 二叉树特性
        
        reverseBetweenA_reverse_toN(l11, 3)
    }
    
    // [92] 反转链表 II
    func reverseBetweenA(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            return reverseBetweenA_reverse_toN(head, right)
        }
        head?.next = reverseBetweenA(head, left - 1, right - 1)
        
        return head
    }
    
    func reverseBetweenA_reverse_toN(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var dump: ListNode? = ListNode(0)
        dump?.next = head
        
        var p: ListNode? = nil
        var cur: ListNode? = head
        var i = 0
        var bf = head
        while cur != nil && i < n {
            var temp = cur?.next
            cur?.next = p
            p = cur
            cur = temp
            i += 1
        }
        bf?.next = cur
        
        return p
    }
    
    func reverseBetweenA_reverse(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var dump: ListNode? = ListNode(0)
        dump?.next = head
        
        var p: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            var temp = cur?.next
            cur?.next = p
            p = cur
            cur = temp
        }
        
        return p
    }
    // [82] 删除排序链表中的重复元素 II
    func deleteDuplicatesB(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var dump: ListNode? = ListNode(0)
        dump?.next = head
        
        var p = dump
        while p?.next != nil && p?.next?.next != nil {
            if p?.next?.val == p?.next?.next?.val {
                let x = p?.next?.val
                while p?.next != nil && p?.next?.val == x {
                    p?.next = p?.next?.next
                }
            } else {
                p = p?.next
            }
        }
        
        return dump?.next
    }
    
    // [61] 旋转链表 给你一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。
    func rotateRightA(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        var l: ListNode? = head
        var n = 0
        while l?.next != nil {
            l = l?.next
            n += 1
        }
        
        l?.next = head
        l = l?.next
        
        var pre: ListNode? = nil
        var i = 0
        while i < (n - k % n) {
            i += 1
            pre = l
            l = l?.next
        }
        
        pre?.next = nil
        
        return l
        
    }
    
    // [25] K 个一组翻转链表
    func reverseKGroupA(_ head: ListNode?, _ k: Int) -> ListNode? {
        var dump: ListNode? = ListNode(0)
        dump?.next = head
        
        var pre = dump
        var end = dump
        
        while end?.next != nil {
            var i = 0
            while i < k && end != nil {
                end = end?.next
                i += 1
            }
            
            if i < k || end == nil {
                continue
            }
            
            var s = pre?.next
            var n = end?.next
            
            end?.next = nil
            pre?.next = reverseList(s)
            s?.next = n
            
            pre = s
            end = pre
        }
        
        return dump?.next
        
//        var dump: ListNode? = ListNode(0)
//        dump?.next = head
//
//        var pre = dump
//        var end = dump
//
//        while end?.next != nil {
//            // 获取k的终点
//            var i = 0
//            while i < k && end != nil {
//                i += 1
//                end = end?.next
//            }
//
//            // 判断是否尾部不足k
//            if i < k || end == nil {
//                continue
//            }
//
//            var start = pre?.next
//            var next = end?.next
//
//            end?.next = nil
//            pre?.next = reverseList(start)
//            start?.next = next
//
//            pre = start
//            end = pre
//        }
//
//        return dump?.next
    }
    
    func ddfdd(_ l: ListNode?) -> ListNode? {
        if l == nil || l?.next == nil {
            return l
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = l
        
        while cur != nil {
            var temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        
        return pre
        
//        if l == nil || l?.next == nil {
//            return l
//        }
//
//        var pre: ListNode? = nil
//        var cur: ListNode? = l
//        while cur != nil {
//            var temp = cur?.next
//            cur?.next = pre
//            pre = cur
//            cur = temp
//        }
//
//        return pre
    }
    
    // 反转m-n的列表M
    func reverseListMNB(_ l: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == 1 {
            return reverseListNB(l, n)
        }
        
        l?.next = reverseListMNB(l, m - 1, n - 1)
        
        return l
    }
    
    // 反转前n个列表
    var successor: ListNode? = nil
    func reverseListNB(_ l: ListNode?, _ n: Int) -> ListNode? {
        if l == nil || l?.next == nil {
            return l
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = l
        var i = 0
        var acc: ListNode? = nil
        while cur != nil && i < n {
            var temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
            if i == 0 {
                acc = pre
            }
            i += 1
        }
        acc?.next = cur
        
        return pre

        // 迭代
//        if n == 1 {
//            successor = l?.next
//            return l
//        }
//
//        var last = reverseListNB(l?.next, n - 1)
//        l?.next?.next = l
//        l?.next = successor
//
//        return last
    }
    
    // 反转列表
    func reverseListB(_ l: ListNode?) -> ListNode? {
        if l == nil || l?.next == nil {
            return l
        }
        
        var pre: ListNode? = nil
        var cur = l
        
        while cur != nil {
            let temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        
        return pre
        
//        if l == nil || l?.next == nil {
//            return l
//        }
//
//        let p = reverseList(l?.next)
//        l?.next?.next = l
//        l?.next = nil
//
//        return p
    }
    
    // [24] 两两交换链表中的节点
    func swapPairsA(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var dump: ListNode? = ListNode(0)
        dump?.next = head
        var cur = dump
        while cur?.next != nil && cur?.next?.next != nil {
            var p: ListNode? = cur?.next
            var q: ListNode? = cur?.next?.next
            
            var temp = q?.next
            cur?.next = q
            q?.next = p
            p?.next = temp
            cur = p?.next
            
        }
        
        return dump?.next
        
        
//        if head == nil || head?.next == nil {
//            return head
//        }
//
//        var p = head?.next
//        head?.next = swapPairs(p?.next)
//        p?.next = head
//
//
//        return p
    }
    
    // [23] 合并K个升序链表
    func mergeKListsA(_ lists: [ListNode?]) -> ListNode? {
        // 1、顺序合并
        
        // 2、分治
        var head = lists
        return build_mergeKListsA(&head, 0, lists.count - 1)
    }
    
    func build_mergeKListsA(_ lists: inout [ListNode?], _ l: Int, _ r: Int) -> ListNode? {
        if l == r {
            return lists[l]
        }
        if l > r {
            return nil
        }
        
        let mid = (r + l) >> 1
        let a = build_mergeKListsA(&lists, l, mid)
        let b = build_mergeKListsA(&lists, mid + 1, r)
        
        return build_mergeKListsA_merge(a, b)
    }
    
    func build_mergeKListsA_merge(_ aa: ListNode?, _ bb: ListNode?) -> ListNode? {
        if aa == nil && bb == nil {
            return aa == nil ? bb : aa
        }
        
        let dump: ListNode? = ListNode(0)
        var pre = dump
        var a = aa
        var b = bb
        while a != nil && b != nil {
            if (a?.val ?? 0) < (b?.val ?? 0) {
                pre?.next = a
                a = a?.next
            } else {
                pre?.next = b
                b = b?.next
            }
            pre = pre?.next
        }
        
        var tail = a
        if a == nil {
            tail = b
        }
        
        pre?.next = tail
        
        return dump?.next
    }
    
    // [21] 合并两个有序链表
    func mergeTwoListsA(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        
//        // 递归方式去实现
//        if l1 == nil {
//            return l2
//        } else if l2 == nil {
//            return l1
//        } else if (l1?.val ?? 0) < (l2?.val ?? 0) {
//            l1?.next = mergeTwoListsA(l1?.next, l2)
//            return l1
//        } else {
//            l2?.next = mergeTwoListsA(l1, l2?.next)
//            return l2
//        }
        
        // 迭代
        if l1 == nil && l2 == nil {
            return nil
        }
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        var dump: ListNode? = ListNode(0)
        var pre: ListNode? = dump
        
        var l = l1
        var r = l2
        while l != nil && r != nil {
            if (l?.val ?? 0) > (r?.val ?? 0) {
                pre?.next = r
                r = r?.next
            } else {
                pre?.next = l
                l = l?.next
            }
            pre = pre?.next
        }
        
        var tail = l
        if l == nil {
            tail = r
        }
        
        pre?.next = tail
        
        return dump?.next
        
        
        
    }
    
    // 141. Linked List Cycle
    func hasCycle(_ head: ListNode?) -> Bool {
        
        
        // 哈西的写法
        var setList = Set<Int>()
        var list: ListNode? = head
        while head != nil {
            if setList.contains(head?.val ?? 0) {
                return true
            } else {
                setList.insert(head?.val ?? 0)
            }
            list = list?.next
        }
        return false
        
//        if head == nil || head?.next == nil {
//            return false
//        }
//
//        var fast: ListNode? = head
//        var slow: ListNode? = head
//        while fast != nil && slow?.next != nil {
//            fast = fast?.next?.next
//            slow = slow?.next
//            if fast?.val == slow?.val {
//                return true
//            }
//        }
//
//        return false
    }
    
    // 206. Reverse Linked List
    func reverseListA(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = head
        while cur != nil {
            var temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        
        return pre
        
        
//        if head == nil || head?.next == nil {
//            return nil
//        }
//
//        let root = reverseList(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//
//        return root
    }
    
    // [908] 最小差值 I
    func smallestRangeI(_ A: [Int], _ K: Int) -> Int {
        if A.count == 0 {
            return 0
        }
        
        var ma = A[0]
        var mi = A[0]
        
        for i in 1..<A.count {
            ma = max(ma, A[i])
            mi = min(mi, A[i])
        }
        
        return max(0, ma - mi - 2 * K)
    }
    
    // [766] 托普利茨矩阵
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return true
        }
        
        var row = matrix.count
        var col = matrix[0].count
        
        for i in 0..<(row - 1) {
            for j in 0..<(col - 1) {
                if matrix[i][j] != matrix[i + 1][j + 1] {
                    return false
                }
            }
        }
        
        return true
    }
    
    
    // [725] 分隔链表
    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var cur: ListNode? = root
        var n = 0
        while cur != nil {
            n += 1
            cur = cur?.next
        }
        
        var w = n / k
        var rem = n % k
        
        var ans = [ListNode].init(repeating: ListNode(0), count: k)
        cur = root
        for i in 0..<k {
            var head: ListNode? = ListNode(0)
            var write: ListNode? = head
            for j in 0..<w + (i < rem ? 1 : 0) {
                write = ListNode(cur?.val ?? 0)
                write = write?.next
                if cur != nil {
                    cur = cur?.next
                }
            }
            ans[i] = (head?.next)!
        }
        
        return ans
    }
    
    func addTwoNumbersL(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = [Int]()
        var list2 = [Int]()
        
        var l: ListNode? = l1
        var r: ListNode? = l2
        
        while l != nil {
            list1.append(l?.val ?? 0)
            l = l?.next
        }
        
        while r != nil {
            list2.append(r?.val ?? 0)
            r = r?.next
        }
        
        var added = 0
        var ans: ListNode? = nil
        while !list1.isEmpty || !list2.isEmpty || added != 0 {
            let a = list1.isEmpty ? 0 : list1.removeLast()
            let b = list2.isEmpty ? 0 : list2.removeLast()
            
            let cur = a + b + added
            
            added = cur % 10
            let curNode = ListNode(cur)
            curNode.next = ans
            ans = curNode
        }
        
        return ans
        
//        ListNode ans = null;
//                while (!stack1.isEmpty() || !stack2.isEmpty() || carry != 0) {
//                    int a = stack1.isEmpty() ? 0 : stack1.pop();
//                    int b = stack2.isEmpty() ? 0 : stack2.pop();
//                    int cur = a + b + carry;
//                    carry = cur / 10;
//                    cur %= 10;
//                    ListNode curnode = new ListNode(cur);
//                    curnode.next = ans;
//                    ans = curnode;
//                }
//                return ans;
        
//        var l: ListNode? = reverser_addTwoNumbers(l1)
//        var r: ListNode? = reverser_addTwoNumbers(l2)
//
//        var added = 0
//        var addList: ListNode? = ListNode(0)
//        var h: ListNode? = addList
//        while l != nil && r != nil {
//            let val = (l?.val ?? 0) + (r?.val ?? 0) + added
//            added = 0
//            if val > 9 {
//                added = 1
//            }
//            h?.next = ListNode(val % 10)
//            h = h?.next
//            l = l?.next
//            r = r?.next
//        }
//
//        if l != nil || r != nil {
//            while l != nil {
//                h?.next = ListNode(((l?.val ?? 0) + added) % 10)
//                added = 0
//                if ((l?.val ?? 0) + added) > 9 {
//                    added = 1
//                }
//                l = l?.next
//                h = h?.next
//            }
//            while r != nil {
//                h?.next = ListNode(((r?.val ?? 0) + added) % 10)
//                added = 0
//                if ((r?.val ?? 0) + added) > 9 {
//                    added = 1
//                }
//                r = r?.next
//                h = h?.next
//            }
//        }
//        if added == 1 {
//            h?.next = ListNode(added)
//        }
//
//        addList = addList?.next
//        return reverser_addTwoNumbers(addList)
    }
    
    func reverser_addTwoNumbers(_ l1: ListNode?) -> ListNode? {
        if l1 == nil || l1?.next == nil {
            return l1
        }
        
        var pre: ListNode? = nil
        var cur: ListNode? = l1
        while cur != nil {
            let tem = cur?.next
            cur?.next = pre
            pre = cur
            cur = tem
        }
        
        return pre
    }
    
    // [328] 奇偶链表 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var evenHead: ListNode? = head?.next
        var odd: ListNode? = head
        var even: ListNode? = evenHead
        
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        
        odd?.next = evenHead
        
        return head
    }
    
    // [237] 删除链表中的节点
    func deleteNode(_ node: ListNode?) {
        if node == nil {
            return
        }
        
        var p: ListNode? = node
        p?.val = p?.next?.val ?? 0
        p?.next = p?.next?.next
    }
    
    // revers just for test
    func reverse_test(_ head: ListNode?) -> ListNode? {
        var cur: ListNode? = head
        var pre: ListNode? = nil
        while cur?.next != nil {
            var temp = cur?.next
            cur?.next = pre
            pre = cur
            cur = temp
        }
        
        return pre
    }
    
    // [234] 回文链表
    var h_isPalindrome: ListNode? = nil
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        if head == nil {
            return true
        }
        
        var list = [ListNode]()
        var p: ListNode? = head
        while p != nil {
            list.append(p!)
            p?.next = p
        }
        
        var i = 0
        var j = list.count - 1
        while i < j {
            if (list[i].val ?? 0) != (list[j].val ?? 0) {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
        
        // e
//        h_isPalindrome = head
//
//        return traverse_isPalindrome(head)
    }
    
    func traverse_isPalindrome(_ headL: ListNode?) -> Bool {
        if headL == nil {
            return true
        }
        
        var res = traverse_isPalindrome(headL?.next)
        res = res && (h_isPalindrome?.val == headL?.val)
        
        h_isPalindrome = h_isPalindrome?.next
        
        return res
    }
    
    // [206] 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var cur: ListNode? = head
        var pre: ListNode? = nil
        while cur != nil {
            var next: ListNode? = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
        
        
//        if head == nil || head?.next == nil {
//            return head
//        }
//        let h: ListNode? = head
//        let newNode = reverseList(h?.next)
//        h?.next?.next = h
//        h?.next = nil
//
//        return newNode
    }
    
    // [203] 移除链表元素
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var dNode: ListNode? = ListNode(0)
        dNode?.next = head
        var h = dNode
        var pre: ListNode? = nil
        while h?.next != nil {
            pre = h
            if h?.next?.val ?? 0 == val {
//                var temp = h?.next?.next
                h?.next = h?.next?.next
            }
            h = h?.next
        }
        
        return dNode?.next
    }
    
    // [160] 相交链表
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil && headB == nil {
            return nil
        }
        
        var h1: ListNode? = headA
        var h2: ListNode? = headB
        
        while h1?.val ?? 0 == h2?.val ?? 0 {
            if h1 != nil {
                h1 = h1?.next
            } else {
                h1 = headB
            }
            
            if h2 != nil {
                h2 = h2?.next
            } else {
                h2 = headA
            }
        }
        
        return h1
    }
    
    // [148] 排序链表
    func sortList(_ head: ListNode?) -> ListNode? {
        return sortList(head, nil)
    }
    
    func sortList(_ head: ListNode?, _ tail: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        if head?.next?.val == tail?.val {
            head?.next = nil
            return head
        }
        
        var slow = head
        var fast = head
        
        while slow?.val != fast?.val{
            slow = slow?.next
            fast = fast?.next
            if fast?.val != tail?.val {
                fast = fast?.next
            }
        }
        
        var mid = slow
        var list1 = sortList(head, mid)
        var list2 = sortList(mid?.next, tail)
        return mergeTwoList(list1, list2)
    }
    
    func mergeTwoList(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var l: ListNode? = left
        var r: ListNode? = right
        
        var dNode: ListNode? = ListNode(0)
        dNode?.next = left
        var temp: ListNode? = dNode
        while l != nil && r != nil {
            if l?.val ?? 0 <= r?.val ?? 0 {
                temp?.next = l
                l = l?.next
            } else {
                temp?.next = r
                r = r?.next
            }
            temp = temp?.next
        }
        
        if l != nil {
            temp?.next = l
        } else {
            temp?.next = r
        }
        
        return dNode?.next
    }
    
    // [147] 对链表进行插入排序
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        var dNode: ListNode? = ListNode(0)
        dNode?.next = head
        var p = head
        var cur = head?.next
        while cur != nil {
            if p?.val ?? 0 <= cur?.val ?? 0 {
                p = p?.next
            } else {
                var pre: ListNode? = dNode
                while pre?.next?.val ?? 0 <= cur?.val ?? 0 {
                    pre = pre?.next
                }
                p?.next = cur?.next
                cur?.next = pre?.next
                pre?.next = cur
            }
            cur = p?.next
        }
        
        return dNode?.next
    }
    
    // [143] 重排链表
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        
        var list = [ListNode]()
        var node = head
        while node != nil {
            list.append(node!)
            node = node?.next
        }
        
        var i = 0
        var j = list.count - 1
        while i < j {
            list[i].next = list[j]
            i += 1
            if i == j {
                break
            }
            list[j].next = list[i]
            j -= 1
        }
        
        list[i].next = nil
    }
    
    // [142] 环形链表 II
    func detectCycle(_ head: ListNode?) -> ListNode? {
        return nil
        
//        if head == nil || head?.next == nil {
//            return nil
//        }
//
//        var slow = head
//        var fast = head
//        while fast != nil && fast?.next != nil {
//            slow = slow?.next
//            fast = fast?.next?.next
//
//            if slow?.val == fast?.val {
//                break
//            }
//        }
//
//        slow = head
//        while slow != fast {
//            slow = slow?.next
//            fast = fast?.next
//        }
//
//        return slow
    }
    
    // [141] 环形链表 给定一个链表，判断链表中是否有环。
    func hasCycleA(_ head: ListNode?) -> Bool{
        if head == nil {
            return false
        }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow?.val == fast?.val {
                return true
            }
        }
        
        return false
    }
    
    // [109] 有序链表转换二叉搜索树
    var glistNode: ListNode?
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//        return buildTree(head, nil)
        glistNode = head
        let len = getListLength(head)
        return nil
    }
    
    func getListLength(_ head: ListNode?) -> Int {
        var h = head
        var length = 0
        while h != nil {
            length += 1
            h = h?.next
        }
        
        return length
    }
    
    func buildTree(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let mid = (right + left + 1) / 2
        var treeNode: TreeNode? = TreeNode()
        treeNode?.left =  buildTree(left, mid - 1)
        treeNode?.val = glistNode?.val ?? 0
        glistNode = glistNode?.next
        treeNode?.right = buildTree(mid + 1, right)
        
        return treeNode
    }
    
    
//    func buildTree(_ left: ListNode?, _ right: ListNode?) -> TreeNode? {
//        if left?.val == right?.val {
//            return nil
//        }
//
//        var midNode: ListNode? = getMid(left, right)
//
//        var treeNode: TreeNode = TreeNode(midNode?.val ?? 0)
//        treeNode.left = buildTree(left, midNode)
//        treeNode.right = buildTree(midNode?.next, right)
//
//        return treeNode
//    }
//
//    func getMid(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
//        var slow = left
//        var fast = left
//        while fast?.val != right?.val && fast?.next?.next?.val != right?.val {
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//
//        return slow
//    }
    
    // [92] 反转链表 II
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dNode: ListNode? = ListNode(0)
        dNode?.next = head
        
        var pre: ListNode? = dNode
        for _ in 0..<left - 1 {
            pre = pre?.next
        }
        
        var cur: ListNode? = pre?.next
        var next: ListNode? = nil
        
        for _ in 0..<right - left + 1 {
            next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        
        return dNode?.next
//        var dNode: ListNode? = ListNode(0)
//        dNode?.next = head
//
//        var pre: ListNode? = dNode
//
//        for _ in 0..<left - 1 {
//            pre = pre?.next
//        }
//
//        var r: ListNode? = pre
//        for _ in 0..<right - left + 1 {
//            r = r?.next
//        }
//
//        var leftNode = pre?.next
//        var cur = r?.next
//
//        // 拿到切断的链表
//        pre?.next = nil
//        r?.next = nil
//
//        leftNode = reverserdList(leftNode)
//
//        pre?.next = r
//        while leftNode?.next != nil {
//            leftNode = leftNode?.next
//        }
//        leftNode?.next = cur
//
//        return dNode?.next
    }
    
    func reverserdList(_ list: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur: ListNode? = list
        
        while cur != nil {
            var next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
    
    // [86] 分隔链表
//    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//
//    }
    
    // [83] 删除排序链表中的重复元素
    func deleteDuplicatesA(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var newHead: ListNode? = ListNode(0)
        newHead?.next = head
        var cur = newHead
        while cur?.next != nil && cur?.next?.next != nil {
            if cur?.next?.val == cur?.next?.next?.val {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        
        return newHead?.next
    }
    
    // [82] 删除排序链表中的重复元素 II
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        var newHead: ListNode? = ListNode(0)
        newHead?.next = head
        var cur = newHead
        while cur?.next != nil && cur?.next?.next != nil {
            if cur?.next?.val == cur?.next?.next?.val {
                let x = cur?.next?.val
                while cur?.next != nil && cur?.next?.val == x {
                    cur?.next = cur?.next?.next
                }
            } else {
                cur = cur?.next
            }
        }
        
        return newHead?.next
    }
    
    // [61] 旋转链表
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        while head == nil || k == 0 || head?.next == nil {
            return head
        }
        
        var n = 1
        var newHead = head
        while newHead?.next != nil {
            newHead = newHead?.next
            n += 1
        }
        
        var nn = k % n
        
        if nn == 0 {
            return head
        }
        
        newHead?.next = head
        var pre = newHead
        var firsthead = head
        var nnn = n - nn
        while nnn > 0 {
            firsthead = firsthead?.next
            pre = pre?.next
            nnn -= 1
        }
        
        pre?.next = nil
        return firsthead
        
    }
    
    // [24] 两两交换链表中的节点 [1, 2, 3, 4]
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        
        var newHead = head?.next
        head?.next = swapPairs(newHead?.next)
        newHead?.next = head
        
        return newHead
        
//        let headD = ListNode(0)
//        headD.next = head
//        var temp: ListNode? = headD
//
//        while temp?.next != nil && temp?.next?.next != nil {
//            let node1 = temp?.next
//            let node2 = temp?.next?.next
//
//            temp?.next = node2
//            node1?.next = node2?.next
//            node2?.next = node1
//            temp = node1
//        }
//
//        return headD.next
    }
    
    // 23 给你一个链表数组，每个链表都已经按升序排列。 请你将所有链表合并到一个升序链表中，返回合并后的链表。
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//        var ans: ListNode? = nil
//        for i in 0..<lists.count {
//            ans = mergeTwoLists(ans, lists[i])
//        }
//
//        return ans
        
        return merge(lists, l: 0, r: lists.count - 1)
    }
    
    func merge(_ lists: [ListNode?], l: Int, r: Int) -> ListNode? {
        if l == r {
            return lists[l]
        }
        
        if l < r {
            return nil
        }
        
        let mid = (l + r) >> 2
        return mergeTwoLists(merge(lists, l: l, r: mid), merge(lists, l: mid + 1, r: r))
    }
    
    // 21 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 != nil ? l1 : l2
        }
        
        var l = l1
        var r = l2
        
        var head = ListNode(0)
        var tail: ListNode? = head
        
        while l != nil && r != nil {
            if l?.val ?? 0 < r?.val ?? 0 {
                tail?.next = l
                l = l?.next
            } else {
                tail?.next = r
                r = r?.next
            }
            tail = tail?.next
        }
        
        tail?.next = l != nil ? l : r
        
        return head.next
        
//        var l = l1
//        var r = l2
//        if l == nil {
//            return r
//        } else if r == nil {
//            return l
//        } else if (l?.val ?? 0) < (r?.val ?? 0) {
//            l?.next = mergeTwoLists(l?.next, r)
//            return l
//        } else {
//            r?.next = mergeTwoLists(l, r?.next)
//            return r
//        }
        
        
        //        var ans: ListNode? = ListNode(0)
//        var pre = ans
//
//        var l = l1
//        var r = l2
//
//        while l != nil && r != nil  {
//            if l?.val ?? 0 <= r?.val ?? 0 {
//                pre?.next = l
//                l = l?.next
//            } else {
//                pre?.next = r
//                r = r?.next
//            }
//            pre = pre?.next
//        }
//
//        pre?.next = l == nil ? r : l
//
//        return ans?.next
        
//        if l1 == nil {
//            return l2
//        }
//
//        if l2 == nil {
//            return l1
//        }
//
//        var l = l1
//        var r = l2
//        var newList: ListNode? = nil
//        var ance: ListNode? = nil
//        var firstFlag = true
//        while l != nil && r != nil {
//            if (l?.val ?? 0) < (r?.val ?? 0){
//                if firstFlag {
//                    newList = l
//                    ance = newList
//                    firstFlag = false
//                } else {
//                    newList?.next = l
//                    newList = newList?.next
//                }
//                l = l?.next
//            } else {
//                if firstFlag {
//                    newList = r
//                    ance = newList
//                    firstFlag = false
//                } else {
//                    newList?.next = r
//                    newList = newList?.next
//                }
//                r = r?.next
//            }
//        }
//
//        while l != nil {
//            newList?.next = l
//            l = l?.next
//            newList = newList?.next
//        }
//
//        while r != nil {
//            newList?.next = r
//            r = r?.next
//            newList = newList?.next
//        }
//
//        return ance
    }
    
    // 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。 进阶：你能尝试使用一趟扫描实现吗？
    // [1, 2] 1
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//        if head == nil {
//            return nil
//        }
//
//        var dump: ListNode? = ListNode(0)
//        dump?.next = head
//        var p = head
//        var q = dump
//        var nn = n
//
//        while nn > 0 && p != nil {
//            p = p?.next
//            nn -= 1
//        }
//
//        while p != nil {
//            p = p?.next
//            q = q?.next
//        }
//
//        q?.next = q?.next?.next
//
//        return dump?.next
        
        
//        if head == nil {
//            return nil
//        }
//
//        var dump: ListNode? = ListNode(0)
//        dump?.next = head
//        var q = head
//        var p = dump
//        var nn = n
//        while nn >= 0 && q != nil {
//            q = q?.next
//            nn -= 1
//        }
//
//        while q != nil {
//            p = p?.next
//            q = q?.next
//        }
//
//        p?.next = p?.next?.next
//
//        return dump?.next
        
        // 栈
//        if head == nil {
//            return nil
//        }
//        let dump: ListNode? = ListNode(0)
//        dump?.next = head
//        var queue = [ListNode]()
//
//        var cur = dump
//        while cur != nil {
//            queue.append(cur!)
//            cur = cur?.next
//        }
//
//        var i = 0
//        while i < n && !queue.isEmpty {
//            queue.removeLast()
//            i += 1
//        }
//
//        let pre = queue.last
//        pre?.next = pre?.next?.next
//
//        return dump?.next
        
        // 双指针
        var dump = ListNode(0)
        dump.next = head
        var fast: ListNode? = head
        var slow: ListNode? = dump
        
        var i = 0
        while i < n && fast != nil {
            fast = fast?.next
            i += 1
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return head
        
        
        // 计算链表的长度
//        let lenght = getLengthList(head)
//        if n > lenght {
//            return head
//        }
//        var dump: ListNode? = ListNode(0)
//        dump?.next = head
//        var root = dump
//        let max = lenght - n + 1
//        for _ in 1..<max {
//            root = root?.next
//        }
//
//        root?.next = root?.next?.next
//
//        return dump?.next
    }
    
    func getLengthList(_ root: ListNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var l = root
        var n = 0
        while l != nil {
            n += 1
            l = l?.next
        }
        
        return n
    }
    
    // 2 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l = l1
        var r = l2
        var head: ListNode? = nil
        var tail = head
        var carry = 0
        
        while l != nil || r != nil {
            let sum = (l?.val ?? 0) + (r?.val ?? 0) + carry
            carry = sum / 10
            
            if head == nil {
                head = ListNode(sum % 10)
                tail = head
            } else {
                tail?.next = ListNode(sum % 10)
                tail = tail?.next
            }
            
            if l != nil {
                l = l?.next
            }
            if r != nil {
                r = r?.next
            }
            
        }
        
        if carry > 0 {
            tail?.next = ListNode(carry)
        }
        
        return tail
        
//        if l1 == nil {
//            return l2
//        }
//        if l2 == nil {
//            return l1
//        }
//
//        var added = 0
//        var newList: ListNode? = nil
//        var retList: ListNode? = nil
//
//        var l = l1
//        var r = l2
//        while l != nil && r != nil {
//            var val = (l?.val ?? 0) + (r?.val ?? 0) + added
//            added = 0
//            if val > 9 {
//                val -= 10
//                added = 1
//            }
//            if newList == nil {
//                newList = ListNode(val)
//                retList = newList
//            } else {
//                newList?.next = ListNode(val)
//                newList = newList?.next
//            }
////            newList = newList?.next
//            l = l?.next
//            r = r?.next
//        }
//
//        while l != nil {
//            var val = (l?.val ?? 0) + added
//            added = 0
//            if val > 9 {
//                val -= 10
//                added = 1
//            }
//            newList?.next = ListNode(val)
//            newList = newList?.next
//            l = l?.next
//        }
//
//        while r != nil {
//            var val = (r?.val ?? 0) + added
//            added = 0
//            if val > 9 {
//                val -= 10
//                added = 1
//            }
//            newList?.next = ListNode(val)
//            newList = newList?.next
//            r = r?.next
//        }
//
//        if added != 0 {
//            newList?.next = ListNode(added)
//        }
//
//        return retList
    }
}
