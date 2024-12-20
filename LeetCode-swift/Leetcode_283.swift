//
//  Leetcode_283.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/12/20.
//
/**
 283. 移动零
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 请注意 ，必须在不复制数组的情况下原地对数组进行操作。
 
 示例 1:
 输入: nums = [0,1,0,3,12]
 输出: [1,3,12,0,0]
 
 示例 2:
 输入: nums = [0]
 输出: [0]
 */
import Foundation
class Leetcode_283 {
    func moveZeroes(_ nums: inout [Int]) {
        var idx = 0;
        var zeroCount = 0;
        while idx < nums.count {
            if (nums[idx] != 0) {
                idx += 1;
                continue;
            }
            
            if idx == nums.count - zeroCount {
                break;
            }
            for i in idx+1..<nums.count-zeroCount {
                nums[i-1] = nums[i];
            }
            nums[nums.count-1-zeroCount] = 0;
            zeroCount += 1;
        }
    }
}
