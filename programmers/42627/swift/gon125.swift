import Foundation

/// - Complexity: O(nlogn)
func solution(_ jobs:[[Int]]) -> Int {
    let jobs = jobs.sorted(by: { $0[0] < $1[0] })
    var priorityQueue = Heap([[Int]]()) { $0[1] < $1[1] }
    var sum = 0
    var currentTime = 0
    var i = 0
    
    /// - Complexity: O(nlogn)
    while (i < jobs.count) {
        /// - Complexity: O(nlogn)
        while (i < jobs.count && jobs[i][0] <= currentTime) {
            priorityQueue.enqueue(jobs[i])
            i += 1
        }
        if let shortestJob = priorityQueue.dequeue() {
            currentTime += shortestJob[1]
            sum += currentTime - shortestJob[0]
        } else {
            currentTime += 1
        }
    }
    
    /// - Complexity: O(n)
    while (!priorityQueue.isEmpty) {
        let shortestJob = priorityQueue.dequeue()!
        currentTime += shortestJob[1]
        sum += currentTime - shortestJob[0]
    }
    
    return sum / jobs.count
}

struct Heap<Element> {
    private var elements: [Element]
    private let priorityFunction: (Element, Element) -> Bool
    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    
    init(_ elements: [Element] = [], _ priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }

    /// - Complexity: O(nlogn)
    mutating private func buildHeap() {
        for parentIndex in (0..<count/2).reversed() {
            shiftDownElementAt(parentIndex)
        }
    }
    
    func peek() -> Element? { elements.first }
    
    /// - Complexity: O(logn)
    mutating func enqueue(_ element: Element) {
        elements.append(element)
        shiftUpElementAt(count-1)
    }
    
    /// - Complexity: O(logn)
    mutating func dequeue() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count-1)
        let dequeued = elements.removeLast()
        shiftDownElementAt(0)
        return dequeued
    }
    
    mutating private func shiftUpElementAt(_ index: Int) {
        let parent = index.parentIndex
        guard !index.isRoot,
              isHigherPriorityAt(index, than: parent) else { return }
        elements.swapAt(parent, index)
        shiftUpElementAt(parent)
    }
    
    mutating private func shiftDownElementAt(_ index: Int) {
        let highest = highestPriorityIndex(index)
        if index == highest { return }
        elements.swapAt(index, highest)
        shiftDownElementAt(highest)
    }
    
    private func isHigherPriorityAt(_ index1: Int, than index2: Int) -> Bool {
        return priorityFunction(elements[index1], elements[index2])
    }
    
    private func highestPriorityIndex(_ parent: Int) -> Int {
        var indices = [parent]
        if parent.leftChildIndex < count { indices.append(parent.leftChildIndex) }
        if parent.rightChildIndex < count { indices.append(parent.rightChildIndex) }
        return indices.min(by: { priorityFunction(elements[$0], elements[$1]) })!
    }
}

fileprivate extension Int {
    var leftChildIndex: Int { 2*self + 1 }
    var rightChildIndex: Int { 2*self + 2 }
    var isRoot: Bool { self == 0 }
    var parentIndex: Int { (self - 1) / 2 }
}
