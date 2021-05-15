import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    numbers.dfs(0, 0, target)
}

extension Array where Element == Int {
    func dfs(_ i: Int, _ prevSum: Int, _ target: Int) -> Int {
        if i == self.count { return prevSum == target ? 1 : 0 }
        return dfs(i+1, prevSum - self[i], target) +
                dfs(i+1, prevSum + self[i], target)
    }
}
