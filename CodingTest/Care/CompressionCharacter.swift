//
//  CompressionCharacter.swift
//  CodingTest
//
//  Created by 백래훈 on 12/19/25.
//

import Foundation

final class CompressionCharacter {
    func solution(_ s: String) -> String {
        var result: [Character] = []

        for char in s {
            if result.last != char {
                result.append(char)
            }
        }
        return String(result)
    }
}
