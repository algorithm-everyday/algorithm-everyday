import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortedCitations = citations.sorted(by: >)
    let hIndexMax = min(citations.count, sortedCitations.first!)
    guard hIndexMax != 0 else { return 0 }
    return (1...hIndexMax).reversed().first(where: { sortedCitations[$0-1] >= $0 })!
}