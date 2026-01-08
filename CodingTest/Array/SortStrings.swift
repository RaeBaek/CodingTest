//
//  SortStrings.swift
//  CodingTest
//
//  Created by 백래훈 on 1/8/26.
//

import Foundation

final class SortStrings {
    /// 문자열로 구성된 리스트 strings, 정수 n
    /// 각 문자열의 인덱스 n번째 글자를 기준으로 오름차순 (<)
    /// 소문자 알파벳 구성
    /// strings는 n보다 큼
    /// 같은 문자열이 여럿 일 경우, 사전순으로 앞선 문자열이 앞쪽에 위치
    func solution(_ strings: [String], _ n: Int) -> [String] {
        let sorted = strings.sorted {
            let left = Array($0)
            let right = Array($1)

            if left[n] == right[n] { return $0 < $1 }
            return left[n] < right[n]
        }
        return sorted
    }
}
