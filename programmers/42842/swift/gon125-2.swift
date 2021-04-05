import Foundation
 /// - Complexity: O(sqrt(*n*)), where *n* is yellow size
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sides = ((1...Int(sqrt(Double(yellow)))).reversed())
    return sides.first(where: { 2*((yellow/$0)+$0) + 4 == brown })
        .map { [$0+2, (yellow/$0)+2].sorted(by: >) }!
}