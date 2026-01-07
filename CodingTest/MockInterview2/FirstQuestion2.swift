//
//  FirstQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/7/26.
//

import Foundation

/*
 1. 사용자 행동 로그가 시간순(오름차순)으로 주어짐
 2. action 빈도가 같다면 가장 먼저 발생한 action을 선택 (timestamp 기준)
 3. 로그는 이미 timestamp 기준의 오름차순으로 주어짐
 */
struct Log {
    let userId: Int
    let action: String
    let timestamp: Int
}

final class FirstQuestion2 {
    /// 사용자별로 가장 많이 발생한 action을 반환
    /// - 규칙:
    ///     1) 빈도수가 가장 높은 action
    ///     2) 빈도수가 같으면 더 먼저 발생한 action (logs는 timestamp 오름차순)
    ///     3) 결과는 userId 오름차순 (Dictionary는 순서를 보장하지 않지만, 테스트/출력 시 정렬하면 됨)
    func solution(_ logs: [Log]) -> Dictionary<Int, String> {
        // userId -> action -> (count, firstTimestamp)
        var perUser: [Int: [String: (count: Int, firstTimestamp: Int)]] = [:]

        // 1) 사용자별 action 정보 누적
        for log in logs {
            var actions = perUser[log.userId, default: [:]]

            if let existing = actions[log.action] {
                // 이미 등장한 action -> count만 증가
                actions[log.action] = (
                    count: existing.count + 1,
                    firstTimestamp: existing.firstTimestamp
                )
            } else {
                // 처음 등장한 action
                actions[log.action] = (
                    count: 1,
                    firstTimestamp: log.timestamp
                )
            }

            perUser[log.userId] = actions
        }

        // 2) 사용자별 best action 선택
        var result: [Int: String] = [:]

        for (userId, actions) in perUser {
            let bestAction = actions.max { lhs, rhs in
                if lhs.value.count != rhs.value.count {
                    return lhs.value.count < rhs.value.count
                }
                return lhs.value.firstTimestamp > rhs.value.firstTimestamp
            }?.key

            result[userId] = bestAction
        }
        return result
    }
}
