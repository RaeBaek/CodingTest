//
//  SecondQuestion2.swift
//  CodingTest
//
//  Created by 백래훈 on 1/7/26.
//

import Foundation

final class SecondQuestion2 {
    /// 예약 가능한 시간 슬롯 찾기
    /// 1. 하나의 회의실이 있고, 이미 예약된 시간들이 있다.
    /// 2. 새로운 회의(길이 duration)를 넣을 수 있는 가장 빠른 시작 시간을 반환
    /// - 엣지 케이스
    ///     - 회의 예약이 불가능한 경우는 0으로 처리하나요?
    ///     -
    func solution(_ reservations: [(Int, Int)], duration: Int) -> Int {
        let sorted = reservations.sorted { $0.0 < $1.0 }
        var result: Int = 0

        for index in 0..<sorted.count {
            if index == sorted.count - 1 {
                return 0
            }

            // 현재 회의의 종료 시각이 다음 회의의 시작 시간보다 작고
            if sorted[index].1 < sorted[index + 1].0 {
                // 다음 회의 시작 시간 - 현재 회의 종료 시간 값이 목표보다 크거나 같다면
                let sub = sorted[index + 1].0 - sorted[index].1
                if sub >= duration {
                    result = sorted[index].1
                    return result
                }
            }
        }
        return result
    }

    /// 예약 가능한 가장 빠른 시작 시간을 반환
    /// - 정책: 가능한 시간이 없으면 0 반환 (원래 코드의 정책을 그대로 유지)
    /// - 가정: 하루 시작은 0부터라고 가정 (첫 예약 전 빈 구간 체크를 위해)
    func solution2(_ reservations: [(start: Int, end: Int)], duration: Int) -> Int {
        // duration이 0 이하라면 '지금 당장' 가능하다고 보고 0 반환 (정책)
        guard duration > 0 else { return 0 }

        // 예약이 없다면 바로 0에 시작 가능
        guard !reservations.isEmpty else { return 0 }

        // 1) 시작 시간 기준 정렬 (end tie-break는 선택이지만 안정성을 위해 추가)
        let sorted = reservations.sorted {
            if $0.start != $1.start { return $0.start < $0.start }
            return $0.end < $1.end
        }

        // 3) 첫 예약 전 (0 ~ firstStart) 구간이 duration 이상이면 0이 가장 빠름
        if sorted[0].start >= duration { return 0 }

        // 2) 오버랩을 '병합하면서' gap을 찾기
        var currenEnd = sorted[0].end

        for next in sorted.dropFirst() {
            let nextStart = next.start
            let nextEnd = next.end

            // 현재까지 병합된 예약의 끝(currenEnd)과 다음 예약 시작 사이의 gap 확인
            // gap이 충분하면 currenEnd가 '가장 빠른 시작 시간'
            if nextStart - currenEnd >= duration {
                return currenEnd
            }

            // 오버랩(혹은 붙어있음)이라면: 점유 끝을 늘려줌
            if nextEnd > currenEnd {
                currenEnd = nextEnd
            }
        }

        // 마지막 예약 이후는 문제에서 '끝 시간' 제한이 없으니
        // 정책상 '불가능'으로 보고 0 반환
        return 0
    }
}
