//
//  main.swift
//  CodingTest
//
//  Created by 백래훈 on 9/21/24.
//

import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    // 시작점과 목표가 동일하면 연산 필요 없음
    if x == y {
        return 0
    }
    
    // BFS 탐색을 위한 큐와 방문 여부를 기록할 배열
    var queue: [(Int, Int)] = [(x, 0)]  // (현재 값, 연산 횟수)
    var visited = Set<Int>()  // 방문한 숫자를 기록하여 중복 계산 방지
    visited.insert(x)
    
    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()
        
        // 가능한 연산들: 더하기 n, 2 곱하기, 3 곱하기
        let nextValues = [current + n, current * 2, current * 3]
        
        for next in nextValues {
            if next == y {
                return count + 1  // 목표값에 도달하면 연산 횟수를 반환
            }
            
            // y를 넘지 않으면서 방문하지 않은 숫자에 대해서만 큐에 추가
            if next <= y && !visited.contains(next) {
                queue.append((next, count + 1))
                visited.insert(next)
            }
        }
    }
    
    return -1  // 목표값에 도달할 수 없는 경우 -1 반환
}

func solutioon2(_ x: Int, _ y: Int, _ n: Int) -> Int {
    if x == y {
        return 0
    }
    
    var queue: [(Int, Int)] = [(x, 0)]
    var visited = Set<Int>()
    visited.insert(x)
    
    while !queue.isEmpty {
        let (current, count) = queue.removeFirst()
        
        let nextValues = [current + n, current * 2, current * 3]
        
        for next in nextValues {
            if next == y {
                return count + 1
            }
            
            if next <= y && !visited.contains(next) {
                queue.append((next, count + 1))
                visited.insert(next)
            }
        }
    }
    return -1
}

import Foundation

func solution3(_ x: Int, _ y: Int, _ n: Int) -> Int {
    // x가 이미 y보다 크면 변환이 불가능하므로 -1 반환
    if x > y {
        return -1
    }
    
    // x에서 y까지의 값을 저장할 DP 배열. 큰 값으로 초기화
    var dp = Array(repeating: Int.max, count: y + 1)
    dp[x] = 0  // 시작점인 x에서 x로 가는 데 필요한 연산 횟수는 0
    
    for i in x...y {
        if dp[i] == Int.max {
            continue  // 이 값에 도달할 수 없다면 다음 값으로 넘어감
        }
        
        // x + n으로 도달할 수 있으면 최소값 갱신
        if i + n <= y {
            dp[i + n] = min(dp[i + n], dp[i] + 1)
        }
        
        // x * 2로 도달할 수 있으면 최소값 갱신
        if i * 2 <= y {
            dp[i * 2] = min(dp[i * 2], dp[i] + 1)
        }
        
        // x * 3으로 도달할 수 있으면 최소값 갱신
        if i * 3 <= y {
            dp[i * 3] = min(dp[i * 3], dp[i] + 1)
        }
    }
    
    // y에 도달할 수 없으면 -1 반환, 그렇지 않으면 dp[y] 반환
    return dp[y] == Int.max ? -1 : dp[y]
}


//let targetNumber = TargetNumber()
//targetNumber.solution([4, 1, 2, 1], 4)

//let wordConversion = WordConversion()
//wordConversion.solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])


//let jumpAndTeleport = JumpAndTeleport()
//let result = jumpAndTeleport.solution(5000)
//print(result)
//
//let multipleOfN = MultipleOfN()
//print(multipleOfN.solution(3, [4, 5, 6, 7, 8, 9, 10, 11, 12]))
//
//let multipleStrings = MultipleStrings()
//print(multipleStrings.solution3("string", 3))

//let doublePriorityQueue = DoublePriorityQueue()
//print(doublePriorityQueue.solution3(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))

//let farthestNode = FarthestNode()
//print(farthestNode.solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))

//let carpet = Carpet()
//print(carpet.solution(24, 24))

//let fatigueLevel = FatigueLevel()
//print(fatigueLevel.solution(80, [[80, 20], [50, 40], [30, 10]]))

//let bestAlbum = BestAlbum()
//print(bestAlbum.solution2(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))

//let makingABigNumber = MakingABigNumber()
//print(makingABigNumber.solution2("1924", 2))

//let joyStick = JoyStick()
//print(joyStick.solution("ZZZAAAAAABB"))

//let emojiDiscountEvent = EmojiDiscountEvent()
//print(emojiDiscountEvent.solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))

//let makeEqualSumTwoQueue = MakeEqualSumTwoQueue()
//print(makeEqualSumTwoQueue.solution([3, 2, 7, 2], [4, 6, 5, 1]))

let consecutiveNumbers = ConsecutiveNumbers()
print(consecutiveNumbers.solution("aacabddbbccannaa"))

print("-----------")

let largestArea = LargestArea()
print(largestArea.solution2([[1, 1, 0, 0], [0, 1, 0, 1], [0, 0, 1, 1], [1, 0, 0, 0]]))

print("-----------")

let appearLastIndex = AppearLastIndex()
print(appearLastIndex.solution2("swiftcoding"))

print("-----------")

let conditionalSimulation = ConditionalSimulation()
print(conditionalSimulation.solution2([4, 2, 3, 6]))

print("-----------")

let compressionCharacter = CompressionCharacter()
print(compressionCharacter.solution("aaabbcccdaa"))

print("-----------")

let sumOfElements = SumOfElements()
print(sumOfElements.solution([1, 2, 3, 4]))

print("-----------")

let highestAppearance = HighestAppearances()
print(highestAppearance.solution2("aabbbccccdd"))

print("-----------")
let differenceBetweenNumbers = DifferenceBetweenNumbers()
print(differenceBetweenNumbers.solution2([3, 5, 2, 6, 6, 8]))

print("-----------")
let mockTest1_1 = MockTest1_1()
print(mockTest1_1.solution2("aaabbcddd"))

print("-----------")
let mockTest1_4 = MockTest1_2()
print(mockTest1_4.solution5([10, 3, 5, 2]))

print("-----------")
let mockTest2_1 = MockTest2_1()
print(mockTest2_1.solution2("aaabbbccdaa"))

print("-----------")
let mockTest2_2 = MockTest2_2()
print(mockTest2_2.solution2([1, 5, 8, 4]))

print("-----------")
let mockTest2_3 = MockTest2_3()
print(mockTest2_3.solution2("havefunonleetcode", 5))

print("-----------")
let mockTest2_4 = MockTest2_4()
print(mockTest2_4.solution2([10, 3, 5, 2]))
