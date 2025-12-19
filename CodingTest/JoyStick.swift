//
//  JoyStick.swift
//  CodingTest
//
//  Created by 백래훈 on 4/16/25.
//

import Foundation

final class JoyStick {
    func solution(_ name: String) -> Int {
        let nameArray = Array(name)
        let length = name.count
        var count = 0
        
        for name in nameArray {
            let up = Int(name.asciiValue! - Character("A").asciiValue!)
            let down = 26 - up
            count += min(up, down)
        }
        
        // 커서 이동 최적화
        var move = length - 1

        for i in 0..<length {
            var nextIndex = i + 1

            // 연속된 'A' 구간 찾기
            while nextIndex < length && nameArray[nextIndex] == "A" {
                nextIndex += 1
            }

            // 이동 거리 최소값 갱신
            let leftThenRight = i * 2 + (length - nextIndex)
            let rightThenLeft = (length - nextIndex) * 2 + i
            move = min(move, leftThenRight, rightThenLeft)
        }

        return count + move
    }
}
