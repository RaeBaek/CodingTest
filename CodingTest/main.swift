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

//let consecutiveNumbers = ConsecutiveNumbers()
//print(consecutiveNumbers.solution("aacabddbbccannaa"))
//
//print("-----------")
//
//let largestArea = LargestArea()
//print(largestArea.solution2([[1, 1, 0, 0], [0, 1, 0, 1], [0, 0, 1, 1], [1, 0, 0, 0]]))
//
//print("-----------")
//
//let appearLastIndex = AppearLastIndex()
//print(appearLastIndex.solution2("swiftcoding"))
//
//print("-----------")
//
//let conditionalSimulation = ConditionalSimulation()
//print(conditionalSimulation.solution2([4, 2, 3, 6]))
//
//print("-----------")
//
//let compressionCharacter = CompressionCharacter()
//print(compressionCharacter.solution("aaabbcccdaa"))
//
//print("-----------")
//
//let sumOfElements = SumOfElements()
//print(sumOfElements.solution([1, 2, 3, 4]))
//

//print("-----------")
//let highestAppearance = HighestAppearances()
//print(highestAppearance.solution2("aabbbccccdd"))

//print("-----------")
//let differenceBetweenNumbers = DifferenceBetweenNumbers()
//print(differenceBetweenNumbers.solution2([3, 5, 2, 6, 6, 8]))

//print("-----------")
//let mockTest1_1 = MockTest1_1()
//print(mockTest1_1.solution2("aaabbcddd"))
//
//print("-----------")
//let mockTest1_4 = MockTest1_2()
//print(mockTest1_4.solution5([10, 3, 5, 2]))
//
//print("-----------")
//let mockTest2_1 = MockTest2_1()
//print(mockTest2_1.solution2("aaabbbccdaa"))
//
//print("-----------")
//let mockTest2_2 = MockTest2_2()
//print(mockTest2_2.solution2([1, 5, 8, 4]))
//
//print("-----------")
//let mockTest2_3 = MockTest2_3()
//print(mockTest2_3.solution2("havefunonleetcode", 5))
//
//print("-----------")
//let mockTest2_4 = MockTest2_4()
//print(mockTest2_4.solution2([10, 3, 5, 2]))

//print("-----------")
//let sumUpQuantity = SumUpQuantity2()
//print(sumUpQuantity.solution([
//    OrderItem(name: "Americano", option: "ICE", quantity: 2),
//    OrderItem(name: "Americano", option: "ICE", quantity: 1),
//    OrderItem(name: "Latte", option: "HOT", quantity: 1)
//]))

//print("-----------")
//let leastRecentlyUsed = LeastRecentlyUsed()
//print(leastRecentlyUsed.solution(
//    [
//        "apple",
//        "banana",
//        "cherry",
//        "grape",
//        "strawberry"
//    ],
//    input: "melon"
//))
//print(leastRecentlyUsed.solution2(
//    [
//        "Apple",
//        "BANANA",
//        "CHerry",
//        "GraPe",
//        "StraWBerry"
//    ],
//    input: "GraPe"
//))
//print(leastRecentlyUsed.solution3(
//    [
//        "Apple",
//        "BANANA",
//        "CHerry",
//        "GraPe",
//        "StraWBerry"
//    ],
//    input: "   "
//))

//print("-----------")
//let leastRecentlyUsed = LeastRecentlyUsed2()
//print(leastRecentlyUsed.solution(
//    [
//        "apple",
//        "banana",
//        "cherry",
//        "grape",
//        "strawberry"
//    ],
//    input: "melon"
//))
//print(leastRecentlyUsed.solution2(
//    [
//        "Apple",
//        "BANANA",
//        "CHerry",
//        "GraPe",
//        "StraWBerry"
//    ],
//    input: "GraPe"
//))
//print(leastRecentlyUsed.solution3(
//    [
//        "Apple",
//        "BANANA",
//        "CHerry",
//        "GraPe",
//        "StraWBerry"
//    ],
//    input: "   "
//))
//
//print(leastRecentlyUsed.solution3(
//    [
//        "Apple",
//        "BANANA",
//        "CHerry",
//        "GraPe",
//        "StraWBerry"
//    ],
//    input: "water             melon"
//))

//print("-----------")
//let apiResponseProcessing = APIResponseProcessing()
//print(
//    apiResponseProcessing.solution2(
//        [
//            Content(id: "1", type: "movie",  title: "Avatar",     score: 8.9),
//            Content(id: "2", type: "tv",     title: "Breaking",   score: 9.5),
//            Content(id: "3", type: "person", title: "Nolan",      score: 9.8),
//            Content(id: "4", type: "movie",  title: "Batman",     score: 9.0),
//            Content(id: "5", type: "tv",     title: "Friends",    score: 8.7),
//            Content(id: "6", type: "person", title: "Spielberg",  score: 9.2),
//            Content(id: "7", type: "movie",  title: "Inception",  score: 9.3),
//            Content(id: "8", type: "tv",     title: "Dark",       score: 9.3),
//            Content(id: "9", type: "person", title: "Tarantino",  score: 9.6),
//            Content(id: "10", type: "movie", title: "Interstellar", score: 9.3),
//
//            // score 동점 + title 정렬 확인용
//            Content(id: "11", type: "movie", title: "Alien",      score: 9.3),
//            Content(id: "12", type: "tv",    title: "Arcane",     score: 9.3),
//            Content(id: "13", type: "person", title: "Fincher",  score: 9.6),
//
//            // 낮은 score 섞기
//            Content(id: "14", type: "movie", title: "Cars",       score: 7.2),
//            Content(id: "15", type: "tv",    title: "Lost",       score: 8.0),
//            Content(id: "16", type: "person", title: "Kubrick",  score: 9.4),
//
//            // 랜덤 섞임
//            Content(id: "17", type: "movie", title: "Joker",      score: 8.8),
//            Content(id: "18", type: "tv",    title: "Dexter",     score: 8.8),
//            Content(id: "19", type: "person", title: "Scorsese", score: 9.1),
//            Content(id: "20", type: "movie", title: "Tenet",      score: 7.9)
//        ],
//        top: 3
//    )
//)

//print("-----------")
//let applyCoupon = ApplyCoupon()
//print(applyCoupon.solution2(
//    12500,
//    coupons: [
//        "10%",
//        "1,000원",
//        "15%",
//        "12%",
//        "1,500원",
//        "2,000원",
//    ]
//))

//print("-----------")
//let combineTwoAPI = CombineTwoAPI()
//let semaphore = DispatchSemaphore(value: 0)
//
//Task {
//    defer { semaphore.signal() }
//
//    do {
//        let result = try await combineTwoAPI.solution(UUID())
//        print(result.user.name)
//        print(result.orders.map { $0.title })
//    } catch {
//        print("유저 조회 실패: \(error)")
//    }
//}
//
//// main.swift(커맨드라인)에서는 비동기 Task가 끝나기 전에 프로세스가 종료될 수 있어,
//// 세마포어로 Task 종료까지 대기합니다.
//semaphore.wait()

//print("-----------")
//let mergingNotificationSettings = MergingNotificationSettings()
//print(mergingNotificationSettings.example())
//
//print("-----------")
//let checker = CheckSeatReservationConflict()
//let reservations: [Reservation] = [
//    // 좌석 1 — 단순 겹침
//    Reservation(seat: 1, start: 10, end: 20),
//    Reservation(seat: 1, start: 15, end: 25), // 겹침
//    Reservation(seat: 1, start: 30, end: 40), // 겹치지 않음
//
//    // 좌석 2 — 연쇄 겹침
//    Reservation(seat: 2, start: 5,  end: 10),
//    Reservation(seat: 2, start: 8,  end: 12), // 겹침
//    Reservation(seat: 2, start: 11, end: 15), // 연쇄 겹침
//
//    // 좌석 3 — 딱 붙는 케이스 (겹치지 않음)
//    Reservation(seat: 3, start: 10, end: 20),
//    Reservation(seat: 3, start: 20, end: 30), // 겹침 아님 (20 < 20 ❌)
//
//    // 좌석 4 — 여러 개 중 일부만 겹침
//    Reservation(seat: 4, start: 1,  end: 3),
//    Reservation(seat: 4, start: 2,  end: 4),  // 겹침
//    Reservation(seat: 4, start: 5,  end: 7)
//]
//let result = checker.solution(reservations)
//
//result.forEach {
//    print("seat: \($0.seat), start: \($0.start), end: \($0.end)")
//}

print("-----------")
let cheatSheet = CheatSheet()
//cheatSheet.inputOutputSingleAndMulti()
//cheatSheet.hashMapIntCount()
//cheatSheet.hashMapCharCount()
cheatSheet.queueExample()

print("-----------")
//let firstQuestion = FirstQuestion()
//print(firstQuestion.mostFrequentEvent(["login","purchase","login","logout","purchase","purchase"]))
//print(firstQuestion.mostFrequentEvent2(["login","login","logout","logout","purchase"]))

//print("-----------")
//let secondQuestion = SecondQuestion()
//print(secondQuestion.normalizeAndUnique2(["  Hello  World ", "hello world", "HELLO   world", "swift"]))

//print("-----------")
//let thirdQuestion = ThirdQuestion()
//print(thirdQuestion.conflictedRooms([
//    Booking(room: 1, start: 10, end: 20),
//    Booking(room: 1, start: 20, end: 30),
//    Booking(room: 4, start: 10, end: 20),
//    Booking(room: 4, start: 15, end: 18),
//    Booking(room: 3, start: 10, end: 20),
//    Booking(room: 3, start: 15, end: 18),
//    Booking(room: 2, start: 10, end: 20),
//    Booking(room: 2, start: 15, end: 18),
//]))
//
//print("-----------")
//let fourthQuestion = FourthQuestion()
//print(fourthQuestion.shortestPath([
//    [0,0,1],
//    [0,0,0],
//    [1,0,0]
//]))
//print(fourthQuestion.shortestPath([
//    [0, 0, 1, 0],
//    [1, 0, 1, 0],
//    [0, 0, 0, 0],
//    [0, 1, 1, 0]
//]))
//print(fourthQuestion.shortestPath([
//    [0, 0, 1, 0],
//    [1, 0, 1, 0],
//    [0, 0, 0, 0],
//    [0, 1, 0, 0],
//    [1, 1, 1, 0]
//]))
//print(fourthQuestion.shortestPath([
//    [0, 0, 1, 0],
//    [1, 0, 1, 0],
//    [0, 0, 0, 0],
//    [0, 1, 0, 0],
//    [1, 1, 1, 0],
//    [1, 1, 1, 0]
//]))
//print(fourthQuestion.shortestPath([
//    [0, 0, 1, 0],
//    [1, 0],
//    [0, 0, 0, 0]
//]))
//
//print("-----------")
//let firstQuestion2 = FirstQuestion2()
//print(firstQuestion2.solution([
//    Log(userId: 1, action: "login", timestamp: 1),
//    Log(userId: 1, action: "purchase", timestamp: 2),
//    Log(userId: 1, action: "login", timestamp: 3),
//    Log(userId: 2, action: "login", timestamp: 4),
//    Log(userId: 2, action: "logout", timestamp: 5),
//    Log(userId: 2, action: "logout", timestamp: 6),
//]))
//
//print("-----------")
//let seoncdQuestion2 = SecondQuestion2()
//print(seoncdQuestion2.solution2([
//    (20, 120),
//    (150, 180),
//    (200, 240)
//], duration: 30))

print("-----------")
let thirdQuestion2 = ThirdQuestion2()
print(thirdQuestion2.solution([
    Product(productId: 1, score: 90),
    Product(productId: 2, score: 95),
    Product(productId: 3, score: 95),
    Product(productId: 4, score: 80),
    Product(productId: 5, score: 85),
    Product(productId: 6, score: 80),
], k: 4))

print("-----------")
let fourthQuestion2 = FourthQuestion2()
print(fourthQuestion2.solution(3, 2, 5))
