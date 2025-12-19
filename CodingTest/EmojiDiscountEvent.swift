//
//  EmojiDiscountEvent.swift
//  CodingTest
//
//  Created by 백래훈 on 4/21/25.
//

import Foundation

final class EmojiDiscountEvent {
    func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
        var result: [Int] = [0, 0]
        
        // DFS를 통해 모든 할인 조합 탐색
        func dfs(_ depth: Int, _ discounts: [Int]) {
            // 할인율 조합과 판매중인 이모티콘 수가 같다면
            if depth == emoticons.count {
                checkUsers(discounts)
                return
            }
            
            for rate in [10, 20, 30, 40] {
                dfs(depth + 1, discounts + [rate])
            }
        }
        
        // 주어진 할인율 조합에 대해 구매자 확인
        func checkUsers(_ discounts: [Int]) {
            var plusUser = 0    // 이번 할인율 조합에서 임티 플러스 가입자 수
            var totalSales = 0  // 이번 할인율 조합에서 실제 매출
            
            for user in users {
                let discountGoal = user[0]  // 해당 유저가 원하는 최소 할인율
                let priceGoal = user[1]     // 해당 유저의 임티 가입 한계 금액
                var userTotal = 0           // 해당 유저가 결제할 총 금액
                
                for (index, rate) in discounts.enumerated() {
                    if rate >= discountGoal {
                        let price = emoticons[index] * (100 - rate) / 100
                        userTotal += price
                    }
                }
                
                // 결제할 총 금액이 임티 가입 한계 금액을 넘으면 임티 가입
                if userTotal >= priceGoal {
                    plusUser += 1
                } else {
                    totalSales += userTotal // 아니면 그냥 결제
                }
            }
            
            // 기존 결과보다 좋은 결과라면 업데이트
            if plusUser > result[0] || (plusUser == result[0] && totalSales > result[1]) {
                result = [plusUser, totalSales]
            }
        }
        dfs(0, [])
        return result
    }
    
    func solution2(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
        var bestResult = (plus: 0, sales: 0)

        func dfs(_ depth: Int, _ discounts: [Int]) {
            if depth == emoticons.count {
                // 할인 조합에 따라 유저 반응 계산
                var (plusCount, totalSales) = (0, 0)

                for user in users {
                    let (minRate, limitPrice) = (user[0], user[1])

                    // 유저 기준에 맞는 이모티콘만 골라서 가격 계산
                    let cost = zip(emoticons, discounts)
                        .filter { $1 >= minRate }
                        .map { $0 * (100 - $1) / 100 }
                        .reduce(0, +)

                    // 조건 판단
                    cost >= limitPrice ? (plusCount += 1) : (totalSales += cost)
                }

                // 최적 결과 갱신
                if plusCount > bestResult.plus || (plusCount == bestResult.plus && totalSales > bestResult.sales) {
                    bestResult = (plusCount, totalSales)
                }
                return
            }

            // 현재 이모티콘에 적용 가능한 할인율 모두 시도
            for rate in [10, 20, 30, 40] {
                dfs(depth + 1, discounts + [rate])
            }
        }

        dfs(0, [])
        return [bestResult.plus, bestResult.sales]
    }
}
