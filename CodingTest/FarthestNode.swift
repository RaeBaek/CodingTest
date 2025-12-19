//
//  FarthestNode.swift
//  CodingTest
//
//  Created by 백래훈 on 3/26/25.
//

import Foundation

final class FarthestNode {
    func solution(_ n: Int, _ edges: [[Int]]) -> Int {
        var graph = Array(repeating: [Int](), count: n + 1)
        
        for edge in edges {
            let a = edge[0]
            let b = edge[1]
            graph[a].append(b)
            graph[b].append(a)
        }
        
        let distFromStart = bfs2(start: 1, graph: graph, n: n)
        
        let maxDist = distFromStart.max() ?? 0
        let farthestNodes = distFromStart.filter { $0 == maxDist }.count
        
        return farthestNodes
    }
    
    func bfs(start: Int, graph: [[Int]], n: Int) -> [Int] {
        var dist = Array(repeating: -1, count: n + 1) // 거리 배열, -1은 아직 방문하지 않은 노드
        dist[start] = 0 // 시작 노드의 거리는 0 설정
        
        var queue = [start]
        var index = 0
        
        print(queue)
        while index < queue.count {
            let node = queue[index]
            index += 1
            
            for neighbor in graph[node] {
                if dist[neighbor] == -1 { // 아직 방문하지 않은 노드
                    dist[neighbor] = dist[node] + 1 // 현재 노드의 거리에 + 1
                    queue.append(neighbor) // 큐에 이웃 노드 추가
                    print(queue)
                }
            }
        }
        return dist
    }
    
    func bfs2(start: Int, graph: [[Int]], n: Int) -> [Int] {
        var dist = Array(repeating: -1, count: n + 1)
        dist[start] = 0
        
        var queue = [start]
        
        print(queue)
        while !queue.isEmpty {
            if let node = queue.first {
                for neighbor in graph[node] {
                    if dist[neighbor] == -1 {
                        dist[neighbor] = dist[node] + 1
                        queue.append(neighbor)
                        print(queue)
                    }
                }
                queue.removeFirst()
                print(queue)
            }
        }
        return dist
    }
}
