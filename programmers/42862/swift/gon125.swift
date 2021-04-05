import Foundation
/// - Complexity: O(*n*), where *n* is students count
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = Array(repeating: 1, count: n)
    lost.forEach { students[$0-1] = 0 }
    reserve.forEach { students[$0-1] += 1 }
    
    for i in students.indices {
        if students[i] == 0 {
            if let before = i-1 >= 0 ? i-1 : nil, students[before] == 2 {
                students[before] = 1
                students[i] = 1
            } else if let after = i+1 < students.count ? i+1 : nil, students[after] == 2 {
                students[after] = 1
                students[i] = 1
            }
        }
    }
    
    return students.filter { $0 >= 1 }.count
}