import Foundation

extension Int {
    var digit:Int {
        var temp:Int = self
        var count:Int = 0
        while temp != 0{
            temp /= 10
            count+=1
        }
        return count
    }
}

extension Array where Element == Int{
    var string:String{
        var temp:String = ""
        for i in self{
            temp+=String(i)
        }
        return temp
    }
}

func priority(_ n1:Int,_ n2:Int)->Bool{
    var n1 = String(n1)
    var n2 = String(n2)
    return Int(n1+n2)! > Int(n2+n1)!
}

func solution(_ numbers:[Int]) -> String {
    var n:Int = 1
    var numbers:[Int] = numbers
    numbers.sort(){priority($0,$1)}
    
    return numbers[0]==0 ? "0" : numbers.string
}
