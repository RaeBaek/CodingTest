//
//  LargestArea.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

/*
 Step 1: (0,0)부터 grid 끝까지 모든 칸을 순회한다.
 Step 2: 만약 현재 칸이 1이면 "새로운 영역 발견"
 Step 3: 그 칸을 시작점으로 상하좌우 연결된 모든 1을 BFS로 탐색
 Step 4: BFS가 끝나면 하나의 영역 크기 완성, maxArea 갱신

 ex)
 [[1, 1, 0, 0],
  [0, 1, 0, 1],
  [0, 0, 1, 1],
  [1, 0, 0, 0]]
 */

final class LargestArea {
    func solution(_ grid: [[Int]]) -> Int {
        // 예외 처리
        if grid.isEmpty { return 0 }

        let rows = grid.count
        let cols = grid[0].count

        // grid를 직접 수정할 거라 var로 복사
        var grid = grid

        let dx = [0, 0, 1, -1]
        let dy = [1, -1 ,0, 0]

        var maxArea = 0
        
        // Step 1: 모든 칸 순회
        for i in 0..<rows {
            for j in 0..<cols {
                // Step 2: 새로운 영역 발견
                if grid[i][j] == 1 {
                    // Step 3: BFS 시작
                    var area = 0
                    var queue = [(Int, Int)]()
                    var index = 0

                    queue.append((i, j))
                    grid[i][j] = 0 // 방문 처리

                    while index < queue.count {
                        let (x, y) = queue[index]
                        index += 1
                        area += 1

                        // Step 3-1: 상하좌우 탐색
                        for d in 0..<4 {
                            let nx = x + dx[d]
                            let ny = y + dy[d]

                            // Step 3-2: 범위 체크
                            if nx < 0 || nx >= rows || ny < 0 || ny >= cols {
                                continue
                            }

                            // Step 3-3: 방문 가능한 1이면 큐에 추가
                            if grid[nx][ny] == 1 {
                                grid[nx][ny] = 0
                                queue.append((nx, ny))
                            }
                        }
                    }
                    // Step 4: 최대 영역 갱신
                    maxArea = max(maxArea, area)
                }
            }
        }
        return maxArea
    }

    func solution2(_ grid: [[Int]]) -> Int {
        // 예외 처리
        if grid.isEmpty { return 0 }

        let rows = grid.count
        let cols = grid[0].count

        // 방문 처리를 위한 grid
        var grid = grid

        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]

        var maxArea = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    var area = 0
                    var queue = [(Int, Int)]()
                    var index = 0

                    queue.append((i, j))
                    grid[i][j] = 0

                    while index < queue.count {
                        let (x, y) = queue[index]
                        index += 1
                        area += 1

                        for d in 0..<4 {
                            let nx = x + dx[d]
                            let ny = y + dy[d]

                            if nx < 0 || nx >= rows || ny < 0 || ny >= cols {
                                continue
                            }

                            if grid[nx][ny] == 1 {
                                grid[nx][ny] = 0
                                queue.append((nx, ny))
                            }
                        }
                    }
                    maxArea = max(maxArea, area)
                }
            }
        }
        return maxArea
    }

    func solution3(_ grid: [[Int]]) -> Int {
        // 예외 처리
        guard !grid.isEmpty else { return 0 }

        let rows = grid.count
        let cols = grid[0].count

        // 방문 처리를 위한 grid
        var grid = grid

        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]

        var maxArea = 0

        for i in 0..<rows {
            for j in 0..<cols {
                if grid[i][j] == 1 {
                    var area = 0
                    var queue = [(Int, Int)]()
                    var index = 0

                    while index < queue.count {
                        let (x, y) = queue[index]
                        index += 1
                        area += 1

                        for k in 0..<4 {
                            let nx = x + dx[k]
                            let ny = y + dy[k]

                            if nx < 0 || nx >= rows || ny < 0 || ny >= cols {
                                continue
                            }

                            if grid[nx][ny] == 1 {
                                grid[nx][ny] = 0
                                queue.append((nx, ny))
                            }
                        }
                    }
                    maxArea = max(maxArea, area)
                }
            }
        }
        return maxArea
    }
}
