//
//  Leetcode_1.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/24.
//
/**
 1. 两数之和  简单 https://leetcode.cn/problems/two-sum/description/
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。

 你可以按任意顺序返回答案。
 
 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]
 
 思路: 先将数组排序，利用有序数组进行求解，使用left = 0, right = n-1两个指针，若nums[left] + nums[right] > target,则说明左边的值需要缩小，将right--,若nums[left] + nums[right] < target 则说明左边的值偏小，将left++
 */
import Foundation

class Leetcode_1 {
    struct ValueIndex {
        let value: Int;
        let index: Int;
    }
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let numIndexes:[ValueIndex] = nums.enumerated().map{
            ValueIndex(value: $1, index: $0);
        }.sorted{
            $0.value < $1.value
        };
        
        var left = 0;
        var right = numIndexes.count - 1;
        while left < right {
            let sum = numIndexes[left].value + numIndexes[right].value;
            if sum == target {
                return [numIndexes[left].index,numIndexes[right].index];
            } else if sum > target {
                right -= 1;
            } else {
                left += 1;
            }
        }
        return [-1,-1];
    }
}
