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
        let m = nums1.count;
        let n = nums2.count;
        if (m+n)%2 != 0 {
            //第k小是从1开始计数，例如第1小，就是排序后的第0个元素。例如m=2,n=1,中午数为第2小的，即第1个元素
            return getKthElement(nums1, nums2, (m+n)/2 + 1);
        } else {
            return (getKthElement(nums1, nums2, (m+n)/2 - 1 + 1) + getKthElement(nums1, nums2, (m+n)/2 + 1))/Double(2);
        }
    }
    
    func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Double {
        let m = nums1.count;
        let n = nums2.count;
        
        var idx1 = 0;
        var idx2 = 0;
        var tmpK = k; //目前还剩余的，没有确定的元素数量
        while true {
            // nums1数组的元素已经被确定完
            if idx1 == m {
                return Double(nums2[idx2 + tmpK - 1]);
            }
            // nums2数组的元素已经被确定完
            if idx2 == n {
                return Double(nums1[idx1 + tmpK - 1]);
            }
            // 最后一个元素，取最小的
            if tmpK == 1 {
                return Double(min(nums1[idx1],nums2[idx2]));
            }
            
            // 取 nums1的 k/2 - 1 和 nums2 的k/2 - 1个元素进行对比，可以确定前k-2个元素。若nums1[k/2-1] < nums2[k/2-1],则
            // nums1的前k/2-1个元素使可以确定的，k值缩小 half个。
            // idx1表示数组1已经被确认加入目标数组的最后一个元素的位置，idx2是数组2已经确认被加入目标数组的最后一个元素的位置
            // 因此要确定nums1这一轮有多少元素被加入目标数组，只需要 newIndex1 - idx1 + 1即可
            let half = tmpK/2;
            let newIndex1 = min(idx1 + half, m) - 1;
            let newIndex2 = min(idx2 + half, n) - 1;
            let p1 = nums1[newIndex1];
            let p2 = nums2[newIndex2];
            if p1 <= p2 {
                tmpK -= (newIndex1 - idx1 + 1);
                idx1 = newIndex1 + 1;
            } else {
                tmpK -= (newIndex2 - idx2 + 1);
                idx2 = newIndex2 + 1;
            }
        }
    }
}
