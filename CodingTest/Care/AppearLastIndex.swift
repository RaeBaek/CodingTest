//
//  AppearLastIndex.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class AppearLastIndex {
    func solution(_ s: String) -> [Character: Int] {
        let chars = Array(s)
        var result: [Character: Int] = [:]

        for i in 0..<chars.count {
            result[chars[i]] = i
        }
        return result
    }

    func solution2(_ s: String) -> [Character: Int] {
        var result: [Character: Int] = [:]

        for (i, c) in s.enumerated() {
            result[c] = i
        }
        return result
    }
}
