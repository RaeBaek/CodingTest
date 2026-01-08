//
//  SortFileNames.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class SortFileNames {
    /// HEAD: 문자열 (대소문자 구분 X)
    /// NUMBER: 숫자
    /// TAIL: 나머지
    /// 우선 HEAD 부분을 기준으로 사전 순 정렬 (오름차순, 대소문자 구문 X)
    /// HEAD가 같을 경우, NUMBER의 숫자 순 정렬 (오름차순, 숫자 앞의 0은 무시)
    /// NUMBER까지 같을 경우, TAIL 입력 순서대로 정렬 유지
    func solution(_ files: [String]) -> [String] {
        let sorted = files.sorted { lhs, rhs in
            let head1 = lhs.isEmpty ? "" : String(lhs.prefix { !$0.isNumber }).lowercased()
            let head2 = rhs.isEmpty ? "" : String(rhs.prefix { !$0.isNumber }).lowercased()

            let number1 = lhs.isEmpty ? "" : lhs.dropFirst(head1.count).prefix { $0.isNumber }
            let number2 = rhs.isEmpty ? "" : rhs.dropFirst(head2.count).prefix { $0.isNumber }

            let tail1 = lhs.isEmpty ? "" : String(lhs.dropFirst(head1.count + number1.count))
            let tail2 = lhs.isEmpty ? "" : String(lhs.dropFirst(head2.count + number2.count))

//            if head1 == head2 {
//                if number1 == number2 {
//                    return lhs < rhs
//                } else {
//
//                }
//            }
            return lhs < rhs
        }
        return []
    }

    func solution2(_ files: [String]) -> [String] {
        struct Parsed {
            let original: String
            let headLower: String
            let number: Int
            let index: Int
        }

        func parse(_ s: String, index: Int) -> Parsed {
            let chars = Array(s)
            var i = 0

            // 1) HEAD: 숫자 나오기 전까지
            while i < chars.count, !chars[i].isNumber { i += 1 }
            let head = String(chars[0..<i])

            // 2) NUMBER: 연속 숫자 (최대 5자리)
            let startNum = i
            var numLen = 0

            while i < chars.count, chars[i].isNumber, numLen < 5 {
                i += 1
                numLen += 1
            }
            let numStr = String(chars[startNum..<(startNum + numLen)])
            let num = Int(numStr) ?? 0

            return Parsed(
                original: s,
                headLower: head.lowercased(),
                number: num,
                index: index
            )
        }

        let parsed = files.enumerated().map { parse($0.element, index: $0.offset) }

        let sorted = parsed.sorted {
            if $0.headLower != $1.headLower { return $0.headLower < $1.headLower }
            if $0.number != $1.number { return $0.number < $1.number }
            return $0.index < $1.index
        }

        return sorted.map { $0.original }
    }
}
