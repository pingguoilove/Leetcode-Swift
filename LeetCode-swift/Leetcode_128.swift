//
//  Leetcode_128.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/12/20.
//
/**
 128. 最长连续序列
 
 给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
 请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
 
 示例 1：

 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 示例 2：

 输入：nums = [0,3,7,2,5,8,4,6,0,1]
 输出：9

 */
import Foundation
class Leetcode_128 {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numSet = Set<Int>();
        for num in nums {
            numSet.insert(num);
        }
        var longest = 0;
        //找到最小的没有前导数num-1的数，然后正向查找
        //如果直接正向查找，可能存在重复的查找，例如[4,20,5,6],在查看以4开头的序列的时候，需要查找4,5,6,在查找以5开头的时候，会查找5,6
        //但是先查找最小的没有前导数的话，查找4开头的时候，会查找4,5,6,查找5,6开头的时候，会跳过
        for num in numSet {
            if false == numSet.contains(num-1) {
                var curLongest = 1;
                var curNum = num;
                while (numSet.contains(curNum+1)) {
                    curNum += 1;
                    curLongest += 1;
                }
                longest = max(longest,curLongest);
            }
                    
        }
        return longest;
    }
}
