//
//  FourthQuestion.swift
//  CodingTest
//
//  Created by 백래훈 on 1/6/26.
//

import Foundation

/*
 1. BFS를 사용한 최단거리 문제로 이해했습니다.
 2. 2차원 배열이 grid로 주어지고 0은 이동 가능, 1은 이동 불가능입니다.
 3. 이동은 상/하/좌/우만 가능합니다.
 4. 마지막으로 시작이나 도착이 벽이면 -1, 도착이 불가능하면 -1을 반환합니다.
 */
final class FourthQuestion {
    func shortestPath(_ grid: [[Int]]) -> Int {
        let rows = grid.count      // 행
        guard rows > 0 else { return -1 }
        let cols = grid[0].count   // 열
        guard cols > 0 else { return -1 }

        // 비정형(행마다 열 길이가 다른) 그리드는 인덱스 오류를 유발할 수 있어 방어 처리
        guard grid.allSatisfy({ $0.count == cols }) else { return -1 }

        // 시작/도착이 벽이면 즉시 종료
        if grid[0][0] == 1 || grid[rows - 1][cols - 1] == 1 {
            return -1
        }

        var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var dists = Array(repeating: Array(repeating: 0, count: cols), count: rows)

        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

        var queue: [(Int, Int)] = [(0, 0)]
        var index = 0
        visited[0][0] = true

        while index < queue.count {
            let (x, y) = queue[index]

            if x == rows - 1 && y == cols - 1 {
                return dists[x][y]
            }

            index += 1

            for (dx, dy) in directions {
                let nx = x + dx
                let ny = y + dy

                // 범위 체크
                if nx < 0 || nx >= rows || ny < 0 || ny >= cols { continue }
                // 벽이거나 방문
                if visited[nx][ny] || grid[nx][ny] == 1  { continue }

                visited[nx][ny] = true
                dists[nx][ny] = dists[x][y] + 1
                queue.append((nx, ny))
            }
        }
        return visited[rows - 1][cols - 1] ? dists[rows - 1][cols - 1] : -1
    }
}
