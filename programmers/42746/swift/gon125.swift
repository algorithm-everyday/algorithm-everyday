import Foundation
/// - Complexity: O(nlogn)
func solution(_ numbers:[Int]) -> String {
    numbers.map { String($0) }.sorted(by: { (s1:String, s2:String) in s1 + s2 > s2 + s1 }).reduce("", +).replacingOccurrences(of: "^0+", with: "0", options: .regularExpression)
}