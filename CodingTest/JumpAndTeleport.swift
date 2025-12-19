//
//  JumpAndTeleport.swift
//  CodingTest
//
//  Created by 백래훈 on 3/20/25.
//

import Foundation

final class JumpAndTeleport {
    func solution(_ n: Int) -> Int {
        var goal = n
        var answer = 0
        
        while goal > 0 {
            if goal % 2 == 0 {
                // 짝수면 텔레포트
                goal /= 2
            } else {
                // 홀수면 1칸 걷기
                goal -= 1
                answer += 1
            }
        }
        return answer
    }
}
