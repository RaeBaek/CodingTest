//
//  FatigueLevel.swift
//  CodingTest
//
//  Created by 백래훈 on 4/2/25.
//

import Foundation

final class FatigueLevel {
    func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
        var maxCount = 0
        var queue: [(remain: Int, visited: [Bool], count: Int)] = [(k, Array(repeating: false, count: dungeons.count), 0)]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            maxCount = max(maxCount, current.count)
            
            for i in 0..<dungeons.count {
                if !current.visited[i] && current.remain >= dungeons[i][0] {
                    var newVisited = current.visited
                    newVisited[i] = true
                    let newRemain = current.remain - dungeons[i][1]
                    queue.append((newRemain, newVisited, current.count + 1))
                }
            }
        }
        return maxCount
    }
    
    func solution2(_ k: Int, _ dungeons: [[Int]]) -> Int {
        var maxCount = 0
        var queue: [(remain: Int, visited: [Bool], count: Int)] = [(k, Array(repeating: false, count: dungeons.count), 0)]
        
        var index = 0
        
        while index < queue.count {
            let current = queue[index]
            index += 1
            maxCount = max(maxCount, current.count)
            
            for i in 0..<dungeons.count {
                if !current.visited[i] && current.remain >= dungeons[i][0] {
                    var newVisited = current.visited
                    newVisited[i] = true
                    let newRemain = current.remain - dungeons[i][1]
                    queue.append((newRemain, newVisited, current.count + 1))
                }
            }
        }
        return maxCount
    }
    
    // 이전 풀이
    func solution3(_ k: Int, _ dungeons: [[Int]]) -> Int {
        var answer: Int = 0
        explore(dungeons: dungeons, answer: &answer, k: k, count: 0)
        
        return answer
    }

    func explore(dungeons: [[Int]], answer: inout Int, k: Int, count: Int) {
        answer = max(answer, count)
        for (i, dungeon) in dungeons.enumerated() {
            var newDungeons: [[Int]] = dungeons
            if dungeon[0] <= k && dungeon[1] <= k {
                let newK = k - dungeon[1]
                newDungeons.remove(at: i)
                explore(dungeons: newDungeons, answer: &answer, k: newK, count: count + 1)
            }
        }
    }
}
