//
//  Leetcode_3.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/24.
//
/**
 3. 无重复字符的最长子串
 
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长
 子串
  的长度。

  

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成
 
 思路： 双指针，前面指针在右移过程中检查是否访问到的元素是否已经被访问过，若没有访问过，则记录下访问历史。若已经访问过，则左指针开始右移，知道遇到和右指针当前处理的字符串相等的位置。在右移的过程中，将访问历史记录删除。
 */
import Foundation

class Leetcode_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if (s.count == 0) {
            return 0;
        }
        let chars = Array(s);
        var left = 0;
        var right = 0;
        var charSets = Set<Character>();
        var maxLen = 1;
        while right < s.count {
            let c = chars[right];
            if charSets.contains(c) {
                while left < right && chars[left] != c {
                    charSets.remove(chars[left]);
                    left += 1;
                }
                //此刻 chars[left] == c,将left移动到c对应的字符之后
                charSets.remove(c);
                left += 1;
            }
            charSets.insert(c);
            //此时,right已经在c对应的位置之后1个了，因此len为right-left
            maxLen = max(maxLen,right-left);
            right += 1;
        }
        return maxLen;
    }
    /**
     非常奇怪，lengthOfLongestSubstring用while循环会超时，但这里用for循环不会。
     */
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        if (s.count == 0) {
            return 0;
        }
        let chars = Array(s);
        var left = 0;
        var right = 0;
        var charSets = Set<Character>();
        var maxLen = 1;
        for right in 0..<s.count {
            let c = chars[right];
            if charSets.contains(c) {
                while left < right && chars[left] != c {
                    charSets.remove(chars[left]);
                    left += 1;
                }
                //此刻 chars[left] == c,将left移动到c对应的字符之后
                charSets.remove(c);
                left += 1;
            }
            charSets.insert(c);
            //此时,right已经在c对应的位置之后1个了，因此len为right-left
            maxLen = max(maxLen,right-left+1);
        }
        return maxLen;
    }
    /**
     为了解决由于窗口左沿频繁操作的问题，用Dictionary代替set，记录每个字符最后出现的位置
     */
    func lengthOfLongestSubstring3(_ s: String) -> Int {
        if (s.count == 0) {
            return 0;
        }
        let chars = Array(s);
        var charDic = [Character:Int]();
        var maxLen = 1;
        var left = 0;
        for i in 0..<chars.count {
            let c = chars[i];
            if let lastIndex = charDic[c], lastIndex >= left {
                left = lastIndex + 1;
            }
            charDic[c] = i;
            maxLen = max(maxLen,i-left+1);
        }
        return maxLen;
    }
}
