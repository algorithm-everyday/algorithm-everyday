//https:programmers.co.kr/learn/courses/30/lessons/12905

import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    
    var board = board.toSolutionBoard

    for y in 1..<board.count {
        for x in 1..<board[0].count {
            if board[y][x] == 0 { continue }
            board[y][x] = min(board[y-1][x-1], board[y-1][x], board[y][x-1]) + 1
            if answer < board[y][x] { answer = board[y][x] }
        }
    }
    
    return answer*answer
}


fileprivate extension Array where Element == Array<Int> {
    
    var toSolutionBoard: [[Int]] {
        var sBoard = self
        let newArray = [Int](repeating: 0, count: self[0].count)
        sBoard.insert(newArray, at: 0)
        for i in 0..<sBoard.count {
            sBoard[i].insert(0, at: 0)
        }
        return sBoard
    }
    
}
