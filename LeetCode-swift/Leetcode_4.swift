//
//  Leetcode_4.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/24.
//
/**
 4. 寻找两个正序数组的中位数
 
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

 算法的时间复杂度应该为 O(log (m+n)) 。

  

 示例 1：

 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 示例 2：

 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
  
 提示：

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106
 
 
 */
import Foundation

class Leetcode_4 {
    /**
     方法1，时间复杂度 O(m+1),空间复杂度O（1）
     中位数的定义为 m+n为奇数时，中位数为第(m+n)/2个数的值, m+n为偶数时,中位数为第(m+n)/2 - 1, (m+n)/2个元素的平均值
     算出中位数的位置，然后用idx1和idx2分别记录用来合并时候，两个数组的下标
     */
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count;
        let n = nums2.count;
        if (m + n == 0) {
            return 0;
        }
        let a:Int,b:Int;
        if (m+n)%2 == 0 {
            a = (m+n)/2 - 1;
            b = (m+n)/2;
        } else {
            a = (m+n)/2;
            b = (m+n)/2;
        }
        
        var idx1 = 0;
        var idx2 = 0;
        var len = 0;
        var sum:Double = 0;
        while true {
            var num = 0;
            if (idx1 >= m) {
                //数组1元素已经用完
                num = nums2[idx2];
                idx2 += 1;
            } else if (idx2 >= n) {
                //数组2元素已经用完
                num = nums1[idx1];
                idx1 += 1;
            } else if (nums1[idx1] > nums2[idx2]) {
                //数组1中的下一个元素比较小
                num = nums2[idx2];
                idx2 += 1;
            } else {
                //数组2中的下一个元素比较小
                num = nums1[idx1];
                idx1 += 1;
            }
            len += 1;
            if len - 1 == a {
                sum += Double(num);
            }
            if len - 1 == b {
                sum += Double(num);
                break;
            }
        }
        return sum/Double(2);
    }
    
    /**
     TODO 方法2： 时间复杂度 O(log(m+n)),空间复杂度O(1)
    通过二分查找来优化log(m+n)，
     */
    func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
        return Double(0);
    }
}
