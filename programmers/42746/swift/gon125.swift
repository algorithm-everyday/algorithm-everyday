import Foundation
/// - Complexity: O(nlogn)
func solution(_ numbers:[Int]) -> String {
    let sortedStrings = numbers.map { String($0) }.sorted(by: { $0+$1 > $1+$0 })
    let stringSum = sortedStrings.reduce("", +)
    return stringSum.first == "0" ? "0" : stringSum
}