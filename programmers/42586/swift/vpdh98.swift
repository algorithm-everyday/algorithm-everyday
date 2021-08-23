import Foundation

let FINISH:Int = 100

class Developer{
    var progressList:[Int]
    var progressSpeedList:[Int]
    var finishWorkCount:[Int] = [Int]()
    var takeOutCount = 0
	var startWorkCount = 0
    
    
    init(_ progress:[Int],_ speed:[Int]){
        progressList = progress
        progressSpeedList = speed
		startWorkCount = progressList.count
    }
    
    func workHard(){
        for i in 0..<progressList.count{
            progressList[i]+=progressSpeedList[i]
            
        }
        if progressList[0] >= FINISH {
                takeOut()
        }
    }
    
    func takeOut(){
		if progressList.count == 0 { return }
        var progressListCopy = progressList[progressList.indices]
        var temp = 0
        temp = progressListCopy.popFirst()!
        if temp >= FINISH{
            takeOutCount+=1
            progressList = [Int](progressListCopy)
            progressSpeedList = [Int](progressSpeedList[progressSpeedList.indices].dropFirst(1))
            takeOut()
        }
        
        if takeOutCount > 0{
            finishWorkCount.append(takeOutCount)
            takeOutCount = 0
        }
    }
    
    func startWork(){
        while progressList.count != 0{
            workHard()
        }
    }
}


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var developer:Developer = Developer(progresses,speeds)
    developer.startWork()
    
    return developer.finishWorkCount
}
