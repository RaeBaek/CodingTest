//
//  ThirdQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/6/26.
//

import Foundation

struct Booking: Hashable {
    let room: Int
    let start: Int
    let end: Int
}

/*
 1. 같은 room 내에서 시간이 겹치는 예약이 하나라면 존재하는 room 번호를 오름차순으로 반환
 2. room 번호를 기준으로 딕셔너리 변환 및 start를 기준으로 오름차순
 3. end과 start를 비교하여 겹치는 룸 번호는 conflicts에 추가
 */
final class ThirdQuestion {
    func conflictedRooms(_ bookings: [Booking]) -> [Int] {
        // 1) 그룹핑
        var dict: [Int: [Booking]] = [:]
        bookings.forEach { dict[$0.room, default: []].append($0) }

        // 2) 좌석별 중복 감지
        var conflicts = Set<Int>()

        for (room, group) in dict {
            let sorted = group.sorted {
                if $0.start == $1.start { return $0.end < $1.end }
                return $0.start < $1.start
            }

            var prevEnd: Int?

            for current in sorted {
                // 중첩 확인 끝은 포함하지 않는 half open: [start, end)
                if let end = prevEnd, current.start < end {
                    conflicts.insert(room)
                    break
                }
                prevEnd = max(prevEnd ?? current.end, current.end)
            }
        }
        return conflicts.sorted()
    }
}
