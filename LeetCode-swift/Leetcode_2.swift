//
//  Leetcode_2.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/24.
//
/**
 2. 两数相加
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
 
 思路： 按位加，用carry来保存进位，下一轮相加的时候，将carry加上，当两个链表的元素都处理完后，记得检查是否还有进位，有的话需要多插入一个node
 */
import Foundation
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Leetcode_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var ans = ListNode();
        var ansP:ListNode? = ans;
        guard l1 != nil else {
            return l2;
        }
        guard l2 != nil else {
            return l1;
        }
        var l1p:ListNode? = l1;
        var l2p:ListNode? = l2;
        var carry = 0;
        while l1p != nil || l2p != nil {
            var sum:Int = 0;
            sum += carry;
            if (l1p != nil) {
                sum += l1p!.val;
                l1p = l1p!.next;
            }
            if (l2p != nil) {
                sum += l2p!.val;
                l2p = l2p!.next;
            }
            let v = sum%10;
            carry = sum/10;
            ansP!.next = ListNode(v);
            ansP = ansP!.next;
        }
        if (carry > 0) {
            ansP!.next = ListNode(carry);
        }
        return ans.next;
    }
}
