//
//  CheckSeatReservationConflict.swift
//  CodingTest
//
//  Created by 백래훈 on 1/5/26.
//

import Foundation

struct Reservation: Hashable {
    let seat: Int
    let start: Int
    let end: Int
}

final class CheckSeatReservationConflict {
    func solution(_ reservations: [Reservation]) -> [Reservation] {
        // 1) 그룹핑
        var dict: [Int: [Reservation]] = [:]
        reservations.forEach { dict[$0.seat, default: []].append($0) }

        // 2) 좌석별 중복 감지
        var conflicts = Set<Reservation>()

        for (_, group) in dict {
            let sorted = group.sorted {
                if $0.start == $1.start { return $0.end < $1.end }
                return $0.start < $1.start
            }

            guard !sorted.isEmpty else { continue }

            var prev = sorted[0]
            var prevEnd = prev.end

            for current in sorted.dropFirst() {
                // 중첩 확인 끝은 포함하지 않는 half open: [start, end)
                if current.start < prevEnd {
                    conflicts.insert(prev)
                    conflicts.insert(current)
                    prevEnd = max(prevEnd, current.end)
                } else {
                    prev = current
                    prevEnd = current.end
                }
            }
        }

        // 3) 안정적인 출력 순서 지정
        return conflicts.sorted {
            if $0.seat != $1.seat { return $0.seat < $1.seat }
            if $0.start != $1.start { return $0.start < $1.start }
            return $0.end < $1.end
        }
    }
}
