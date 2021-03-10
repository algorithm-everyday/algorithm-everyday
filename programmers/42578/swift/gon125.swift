/*
 조합 수 -> 조합
 의상 수 30개 이하 -> 의상 종류 많아봐야 30개
 중복 X
 최소 하나는 입음 -> 아예 안 입는 경우 빼기
 해결법: 의상 이름 중복이 없기 때문에 종류만 카운트 해서 조합 구하고 -1 (아예 안입는 경우)
 */
import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var hashTable = [String: Int]()
    
    for cloth in clothes {
        if hashTable[cloth[1]] == nil {
            hashTable[cloth[1]] = 2
        } else {
            hashTable[cloth[1]]! += 1
        }
    }
    
    let result = hashTable.values.reduce(1, {$0*$1}) - 1
    return result
}