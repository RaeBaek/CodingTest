//
//  LeastRecentylUsed.swift
//  CodingTest
//
//  Created by 백래훈 on 1/4/26.
//

import Foundation

final class LeastRecentlyUsed {
    /// 최소 기능 구현 (LRU)
    func solution(_ strings: [String], input: String) -> [String] {
        var results: [String] = []
        results.reserveCapacity(5)
        results = strings

        if results.contains(input), let index = results.firstIndex(of: input) {
            results.remove(at: index)
        } else if !results.contains(input) && results.count == 5 {
            results.removeLast()
        }

        results.insert(input, at: 0)
        return results
    }

    /// + 대소문자 일괄 처리
    func solution2(_ strings: [String], input: String) -> [String] {
        var results: [String] = []
        results.reserveCapacity(5)
        results = strings.map { $0.lowercased() }

        let input = input.lowercased()

        if results.contains(input), let index = results.firstIndex(of: input) {
            results.remove(at: index)
        } else if !results.contains(input) && results.count == 5 {
            results.removeLast()
        }

        results.insert(input, at: 0)
        return results
    }

    /// + 공백/빈 문자열 무시 처리
    func solution3(_ strings: [String], input: String) -> [String] {
        var results: [String] = []
        results.reserveCapacity(5)
        results = strings.map { $0.lowercased() }

        let input = input.lowercased().trimmingCharacters(in: .whitespaces)

        if input.isEmpty {
            return results
        } else if results.contains(input), let index = results.firstIndex(of: input) {
            results.remove(at: index)
        } else if !results.contains(input) && results.count == 5 {
            results.removeLast()
        }

        results.insert(input, at: 0)
        return results
    }
}

final class LeastRecentlyUsed2 {
    private let capacity = 5

    /// 최소 기능 구현 (LRU)
    func solution(_ strings: [String], input: String) -> [String] {
        updateCache(
            strings,
            input: input,
            normalizeCase: false,
            normalizeWhitespace: false,
            collapseInnerWhitespace: false
        )
    }

    /// + 대소문자 일괄 처리
    func solution2(_ strings: [String], input: String) -> [String] {
        updateCache(
            strings,
            input: input,
            normalizeCase: true,
            normalizeWhitespace: false,
            collapseInnerWhitespace: false
        )
    }

    /// + 공백/빈 문자열 무시 처리
    /// - Note: 문자열 내부의 연속 공백은 1개로 축약합니다. ("a   b" -> "a b")
    func solution3(_ strings: [String], input: String) -> [String] {
        updateCache(
            strings,
            input: input,
            normalizeCase: true,
            normalizeWhitespace: true,
            collapseInnerWhitespace: true
        )
    }

    private func updateCache(
        _ strings: [String],
        input: String,
        normalizeCase: Bool,
        normalizeWhitespace: Bool,
        collapseInnerWhitespace: Bool
    ) -> [String] {
        var results = normalizeCase ? strings.map { $0.lowercased() } : strings

        let normalizedInput: String = {
            var s = normalizeCase ? input.lowercased() : input
            if normalizeWhitespace {
                s = s.trimmingCharacters(in: .whitespacesAndNewlines)
            }

            if collapseInnerWhitespace {
                s = collapseWhitespace(s)
            }

            return s
        }()

        // 공백/빈 문자열 무시
        if normalizedInput.isEmpty {
            return results
        }

        // 같은 문자열 존재 시
        if let index = results.firstIndex(of: normalizedInput) {
            results.remove(at: index)
        } else if results.count == capacity {
            results.removeLast()
        }

        results.insert(normalizedInput, at: 0)

        return results
    }

    private func collapseWhitespace(_ s: String) -> String {
        // 문자열 내부의 여러 공백/탭/줄바꿈 등을 단일 공백으로 축약
        s.split(whereSeparator: { $0.isWhitespace }).joined(separator: " ")
    }
}
