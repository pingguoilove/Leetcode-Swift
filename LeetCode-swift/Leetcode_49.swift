//
//  Leetcode_49.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/12/20.
//
/**
 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。
 字母异位词 是由重新排列源单词的所有字母得到的一个新单词。
 
 示例 1:

 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 示例 2:

 输入: strs = [""]
 输出: [[""]]
 示例 3:

 输入: strs = ["a"]
 输出: [["a"]]
 */
import Foundation
class Leetcode_49 {
    /*
     对字符进行排序作为key，然后用map存储
     */
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res:[[String]] = [];
        var resMap:[String:[String]] = [String:[String]]();
        for i in 0..<strs.count {
            var chars = Array(strs[i]);
            chars.sort{
                $0<$1
            };
            let key = String(chars);
            if let list = resMap[key] {
                resMap[key] = list + [strs[i]];
            } else {
                resMap[key] = [strs[i]];
            }
        }
        for key in resMap.keys {
            res.append(resMap[key]!);
        }
        return res;
    }
}
