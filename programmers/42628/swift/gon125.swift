import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for operation in operations {
        let operation = operation.split(separator: " ")
        let number = Int(operation[1])!
        switch operation[0] {
        case "I": queue.binaryInsert(number)
        case "D":
            guard !queue.isEmpty else { break }
            number > 0 ? queue.removeLast() : queue.removeFirst()
        default: break
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.last!, queue.first!]
}

fileprivate extension Array where Element == Int {
    mutating func binaryInsert(_ element: Int) {
        guard !self.isEmpty else { self.append(element); return }
        
        var start = 0; var end = self.count - 1
        
        while (start <= end) {
            let mid = (end + start) / 2
            if element > self[mid] {
                start = mid+1
            } else {
                end = mid-1
            }
        }
        self.insert(element, at: start)
    }
}