import Foundation
/// - Complexity: O(n^2), where n is name length
func solution(_ name:String) -> Int {
    var name = Array(name.map { Int($0.asciiValue! - 65) })
    var matched = name.filter { $0 == 0 }.count
    
    var count = 0
    var i = 0
    for _ in 0..<name.count {
        if name[i] != 0 {
            count += min(name[i], 26 - name[i])
            name[i] = 0
            matched += 1
        }
        guard matched < name.count else { break }
        let (next, distance) = nearestTarget(from: i, with: name)
        i = next
        count += distance
    }
    
    return count
}

func nearestTarget(from i: Int, with name: [Int]) -> (Int, Int) {
    var left = i == 0 ? name.count-1 : i-1
    var right = (i+1)%name.count
    var distance = 1
    
    while name[left] == 0 && name[right] == 0 && distance <= name.count/2 {
        left = left == 0 ? name.count-1 : left - 1
        right = (right+1)%name.count
        distance += 1
    }
    
    return name[right] != 0 ? (right, distance) : (left, distance)
}
