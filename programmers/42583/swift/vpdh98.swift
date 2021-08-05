import Foundation

extension Array where Element == Int{
    mutating func sum()->Int{
        var temp = 0
        for i in self {
            temp+=i
        }
        return temp
    }
    
    mutating func plusOne(){
        for i in 0..<self.count{
            self[i]+=1
        }
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var tw = truck_weights
    var bridge:Array<Int> = Array<Int>()
    var bridgeTime:Array<Int> = Array<Int>()
    var time:Int = 0
    
    repeat{
        var truck:Int = 0
        if tw.count != 0{
            truck = tw[0]
        }
        if bridgeTime.count != 0{
            if bridgeTime[0] >= bridge_length{
                bridge.remove(at:0)
                bridgeTime.remove(at:0)
				
            }
        }
        if bridge.sum()+truck <= weight && tw.count != 0 {
            bridge.append(truck)
            bridgeTime.append(0)
            tw.remove(at:0)
        }
        
        bridgeTime.plusOne()
        time+=1
    }while tw.count != 0 || bridge.count != 0 
    
    return time
}
