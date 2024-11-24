//
//  Stack.swift
//  LeetCode-swift
//
//  Created by Jun Zhang on 2024/11/24.
//

import Foundation

struct Stack<Element> {
    private var elements:[Element]=[];
    mutating public func push(_ element: Element) {
        elements.append(element);
    }
    mutating public func pop() -> Element? {
        return elements.popLast();
    }
    public func peek() -> Element? {
        return elements.last;
    }
    public func empty() -> Bool {
        return elements.count == 0;
    }
    mutating public func clear() {
        elements.removeAll();
    }
}
