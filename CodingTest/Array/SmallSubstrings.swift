//
//  SmallSubstrings.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class SmallSubstrings {
    /// 숫자로 이루어진 문자열 't', 'p'
    /// t가 기준이며 t안에 p 길이의 문자열보다 작거나 같은 수를 count
    func solution(_ t: String, _ p: String) -> Int {
        var array = Array(t)
        var result: Int = 0

        for i in 0..<t.count - (p.count - 1) {
            let value = Int(String(array[i...i + (p.count - 1)])) ?? 0
            if value <= Int(p)! {
                result += 1
            }
        }

        return result
    }
}
