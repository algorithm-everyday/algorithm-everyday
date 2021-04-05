import Foundation
 /// - Complexity: O(nlogn)
func solution(_ answers:[Int]) -> [Int] {
     let soopojas = [soopoja([1,2,3,4,5]), soopoja([2,1,2,3,2,4,2,5]), soopoja([3,3,1,1,2,2,4,4,5,5])]
    
    let scores = soopojas.map { soopoja in
        answers.enumerated().filter { soopoja.answer(of: $0) == $1 }.count
    }.enumerated().sorted(by: { $0.element > $1.element })
    
    return scores.filter { $0.element == scores.first?.element }.map { $0.offset + 1 }
}

struct soopoja {
    let wayToSolve: [Int]
    
    init(_ wayToSolve: [Int]) {
        self.wayToSolve = wayToSolve
    }
    
    func answer(of number: Int) -> Int {
        wayToSolve[number % wayToSolve.count]
    }
}
