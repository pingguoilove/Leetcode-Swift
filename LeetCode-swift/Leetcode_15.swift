//
//  Leetcode_15.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/12/20.
//
/**
 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。
 
 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 解释：
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
 不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
 注意，输出的顺序和三元组的顺序并不重要。
 示例 2：

 输入：nums = [0,1,1]
 输出：[]
 解释：唯一可能的三元组和不为 0 。
 */
import Foundation

class Leetcode_15 {
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res:[[Int]] = [];
        let values = nums.sorted{
            $0 < $1;
        }
        for i in 0..<nums.count-2 {
            if i > 0 && values[i] == values[i-1] {
                continue;
            }
            var left = i + 1;
            var right = nums.count - 1;
            while left < right {
                let sum = values[i] + values[left] + values[right];
                if sum == 0 {
                    res.append([values[i],values[left],values[right]]);
                    left += 1;
                    right -= 1;
                    //去除left重复元素
                    while left < right && values[left] == values[left-1] {
                        left += 1;
                    }
                    //去除right重复元素
                    while left < right && values[right] == values[right+1] {
                        right -= 1;
                    }
                } else if sum < 0 {
                    left += 1;
                } else {
                    right -= 1;
                }
            }
        }
        return res;
    }
}
