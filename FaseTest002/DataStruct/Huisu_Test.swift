/**
 * @Name: Huisu_Test.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/21
 * @Copyright: 
 */


import UIKit

class Huisu_Test: NSObject {
    
    func test() {
        let s = stride(from: 10, through: 0, by: -1)
        for i in s {
            for j in stride(from:10, to: 0, by: -1) {
                print(i, j)
            }
        }
        
//        solveNQueens(8)
//        permuteUnique([1, 1, 3])
//        totalNQueens(8)
        getPermutation(9, 24)
    }
    
    
    
    // [77] 组合
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        
//    }
    
    // [60] 排列序列
    var list_getPermutation: [Character]? = nil
    var retFlag_getPermutation = false
    func getPermutation(_ n: Int, _ k: Int) -> String {
        list_getPermutation = [Character]()
        for i in 1...n {
            list_getPermutation?.append(Character("\(i)"))
        }
        var ans = [String]()
        var track = ""
        backTrack_getPermutation(&track, &ans, n, k)
//        ans.sort(by: { $0 < $1 })
        return ans[k - 1]
    }
    
    func backTrack_getPermutation(_ track: inout String, _ ans: inout [String], _ n: Int, _ index: Int) {
        if (list_getPermutation?.count)! == track.count {
            if ans.count == index {
                retFlag_getPermutation = true
            }
            ans.append(track)
            return
        }
        
        for i in 0..<(list_getPermutation?.count)! {
            if track.contains(list_getPermutation![i]) {
                continue
            }
            if retFlag_getPermutation {
                return
            }
            track.append(list_getPermutation![i])
            backTrack_getPermutation(&track, &ans, n + 1, index)
            track.removeLast()
        }
    }
    
    // [52] N皇后 II
    func totalNQueens(_ n: Int) -> Int {
        var track = [[String]].init(repeating: [String].init(repeating: ".", count: n), count: n)
        var num = 0
        backTrack_totalNQueens(&track, 0, &num)
        return num
    }
    
    func backTrack_totalNQueens(_ track: inout [[String]], _ row: Int, _ num: inout Int) {
        // 终止条件
        if track.count == row {
            num += 1
            return
        }
        
        //
        for i in 0..<track.count {
            if !isbackTrack_totalNQueens(track, row, i) {
                continue
            }
            track[row][i] = "Q"
            backTrack_totalNQueens(&track, row + 1, &num)
            track[row][i] = "."
        }
    }
    
    func isbackTrack_totalNQueens(_ track: [[String]], _ row: Int, _ col: Int) -> Bool {
        var n = track.count
        // top
        for i in 0..<row {
            if track[i][col] == "Q" {
                return false
            }
        }
        
        // left
        var j = col - 1
        var i = row - 1
        while j >= 0 && i >= 0 {
            if track[i][j] == "Q" {
                return false
            }
            j -= 1
            i -= 1
        }
        
        // right
        i = row - 1
        j = col + 1
        while j < n && i >= 0 {
            if track[i][j] == "Q" {
                return false
            }
            j += 1
            i -= 1
        }
        
        return true
    }
    
    // [47] 全排列 II
    var res_permute_unique = [[Int]]()
    var res_set_permute = Set<[Int]>()
    var res_bools: [Bool]? = nil
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        res_bools = [Bool].init(repeating: false, count: nums.count)
        backtrack_permuteUnique(nums, 0, &track)
        for item in res_set_permute {
            res_permute_unique.append(item)
        }
        return res_permute_unique
    }
    
    func backtrack_permuteUnique(_ nums: [Int], _ idx: Int, _ track: inout [Int]) {
        if idx == nums.count {
            res_set_permute.insert(track)
            return
        }
        
        for i in 0..<nums.count {
            //
            if (res_bools?[i])! {
                continue
            }
            
            track.append(nums[i])
            res_bools?[i] = true
            backtrack_permuteUnique(nums, idx + 1, &track)
            res_bools?[i] = false
            track.removeLast()
        }
    }
    
    // [46] 全排列
    var res_permute = [[Int]]()
    func permute(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        backTrackpermute(nums, &track)
        return res_permute
    }
    
    func backTrackpermute(_ nums: [Int], _ track: inout [Int]) {
        if nums.count == track.count {
            res_permute.append(track)
            return
        }
        
        for i in 0..<nums.count {
            if track.contains(nums[i]) {
                continue
            }
            track.append(nums[i])
            backTrackpermute(nums, &track)
            track.removeLast()
        }
    }
    
    
    
    // [51] N 皇后
    var queensList = [[String]]()
    func solveNQueens(_ n: Int) -> [[String]] {
        var board =  [[String]].init(repeating: [String].init(repeating: ".", count: n), count: n)
        backTrack(&board, 0)
        return queensList
    }
    
    func backTrack(_ board: inout [[String]], _ row: Int) {
        if row == board.count {
//            queensList.append(board)
            var list = [String]()
            for b in board {
                var bStr = ""
                for bb in b {
                    bStr.append(bb)
                }
                list.append(bStr)
            }
            queensList.append(list)
            return
        }
        
        var n = board[row].count
        // 遍历每一列
        for col in 0..<n {
            if !isValidTrack(&board, row, col) {
                continue
            }
            board[row][col] = "Q"
            backTrack(&board, row + 1)
            board[row][col] = "."
        }
    }
    
    func isValidTrack(_ board: inout [[String]], _ row: Int, _ col: Int) -> Bool {
        let n = board.count
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // 左上方
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // 右上方
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
}
