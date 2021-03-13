import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var currentTime = 0
    var sum = 0
    var i = 0
    var queue = [(timeStamp: Int, weight: Int)]()
    
    while i < truck_weights.count {
        if sum + truck_weights[i] <= weight {
            sum += truck_weights[i]
            queue.append((timeStamp: currentTime, weight: truck_weights[i]))
            i += 1
            currentTime += 1
            if currentTime - queue.first!.timeStamp == bridge_length {
                let first = queue.removeFirst()
                sum -= first.1
            }
        } else {
            let waitingTime = bridge_length - (currentTime - queue.first!.timeStamp)
            currentTime += waitingTime
            let first = queue.removeFirst()
            sum -= first.1
        }
    }

    while !queue.isEmpty {
        let first = queue.removeFirst()
        currentTime += bridge_length - (currentTime - first.timeStamp) + 1
    }
    
    return currentTime
}