import Foundation

func solution(_ progresses: [Int], _ speeds: [Int]) -> [Int] {
    var currentTask = 0
    var result = [Int]()
    while (currentTask < progresses.count) {
        let progress = Double(progresses[currentTask])
        let speed = Double(speeds[currentTask])
        let daysToComplete = Int(ceil((100.0 - progress) / speed))
        
        let firstFinishedTask = currentTask
        repeat {
            currentTask += 1
        } while currentTask < progresses.count
            && progresses[currentTask] + speeds[currentTask] * daysToComplete  >= 100
        let finishedTaskCount = currentTask - firstFinishedTask
        result.append(finishedTaskCount)
    }
    return result
}

