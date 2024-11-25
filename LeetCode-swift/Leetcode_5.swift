//
//  Leetcode_5.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/25.
//
/**
 给你一个字符串 s，找到 s 中最长的回文子串
 
 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母组成
 
 */
import Foundation
class Leetcode_5 {
    /**
     方法一： 中心扩散法
     遍历s的每一个字符，从字符位置向左右扩散，若s[left] == s[right],则继续扩散到s[left-1],s[right+1]，直到不能扩展为止
     有两种情况 ABA型，和ABBA型
      对于位置i,若其是ABA型，则 s[i] == s[i], s[i-1] == s[i+1],若其是ABBA型，则 s[i] == s[i+1],s[i-1] == s[i+2]
     */
    func longestPalindrome(_ s: String) -> String {
        if (s.count == 0) {
            return "";
        }
        var start = 0, end = 0;
        let chars = Array(s);
        var maxLen = 0;
        for i in 0..<s.count {
            let abaLen = find(chars,i,i);
            let abbaLen = find(chars,i,i+1);
            let curMax = max(abaLen,abbaLen);
            maxLen = max(maxLen,curMax);
            if maxLen == curMax {
                //更新star和end, maxLen有奇数和偶数两种情况，偶数说明是ABBA型，奇数说明是ABA型
                if (curMax % 2 == 0) {
                    start = i - (curMax/2 - 1);
                    end = i + curMax/2;
                } else {
                    start = i - curMax/2;
                    end = i + curMax/2;
                }
            }
        }
        return String(chars[start...end]);
    }
    
    func find(_ s: [Character], _ i: Int, _ j: Int) -> Int {
        var left = i;
        var right = j;
        while left >= 0 && right < s.count && s[left] == s[right] {
            left -= 1;
            right += 1;
        }
        //在循环结束的时候，left会多-1，right会多+1，因此长度为 (right - 1) - (left + 1) + 1 = right - left - 1
        return right - left - 1;
    }
    /**
     方法二：动态规划法
     f(i,j)表示从第i个位置到第j个位置是否是回文串，若f(i-1,j+1)是回文串，且s[i-1] == s[j+1),则f(i,j)也是回文串
     */
}
