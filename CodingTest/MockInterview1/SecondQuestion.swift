//
//  SecondQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/6/26.
//

import Foundation

final class SecondQuestion {
    func normalizeAndUnique(_ queries: [String]) -> [String] {
        var normalized: [String] = []
        var result: [String] = []

        queries.forEach {
            normalized.append($0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                .split(whereSeparator: { $0.isWhitespace }).joined(separator: " "))
        }

        for word in normalized {
            if !result.contains(word) {
                result.append(word)
            }
        }

        return result
    }

    func normalizeAndUnique2(_ queries: [String]) -> [String] {
        var normalized: [String: Int] = [:]
        var result: [String] = []

        queries.forEach {
            normalized[$0.trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
                .split(whereSeparator: { $0.isWhitespace })
                .joined(separator: " "), default: 0] += 1
        }

        normalized.forEach {
            result.append($0.key)
        }

        return result
    }

    private func normalize(_ input: String) -> String {
        input
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
            .split(whereSeparator: { $0.isWhitespace })
            .joined(separator: " ")
    }

    func normalizeAndUnique3(_ queries: [String]) -> [String] {
        var seen = Set<String>()
        var result: [String] = []

        for query in queries {
            let key = normalize(query)
            if seen.insert(key).inserted {
                result.append(key)
            }
        }
        return result
    }

    func normalizeAndUnique4(_ queries: [String]) -> [String] {
        var seen: [String: Bool] = [:]
        var result: [String] = []

        for query in queries {
            let key = normalize(query)
            if seen[key] != true {
                seen[key] = true
                result.append(key)
            }
        }
        return result
    }
}
