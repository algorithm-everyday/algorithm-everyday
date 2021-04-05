import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    guard yellow > 1 else { return [3, 3] }
    return yellow.primeFactors.allCombinations.sorted(by: >)
        .first(where: { 2*((yellow/$0)+$0) + 4 == brown })
        .map { [$0+2, (yellow/$0)+2] }!
}

extension Array where Element == Int {
    var allCombinations: Set<Int> {
        var result = [Int]()
        for i in 1...self.count {
            result += combination(self, i)
        }
        return Set(result)
    }
    
    private func combination(_ array: [Int], _ r: Int) -> [Int] {
        guard array.count != r else { return [array.reduce(1, *)]}
        guard r > 1 else { return array }
        var result = [Int]()
        var temp = array
        let chosen = temp.first!
        temp.remove(at: 0)
        let combinationWithChosen = combination(temp, r-1).map { $0*chosen }
        let combinationWithoutChosen = combination(temp, r)
        result += combinationWithChosen
        result += combinationWithoutChosen
        return result
    }
}

extension Int {
    var primeFactors: [Int] {
        guard self > 1 else { return [] }
        let max = self > 4 ? Int(sqrt(Double(self))) : self
        var primes = [Int]()
        var number = self
        
        for factor in stride(from: 2, through: max, by: 1) {
            while ( number % factor == 0) {
                number = number / factor
                primes.append(factor)
            }
        }
        if number > 1 {
            primes.append(number)
        }
        return primes
    }
}
