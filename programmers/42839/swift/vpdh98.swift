import Foundation

func stochararr(_ str:String)->Array<Character>{
	var arr:Array<Character> = Array<Character>()
	for c in str{
		arr.append(c)
	}
	return arr
}

func chararrtos(_ str:Array<Character>)->String{
	var arr:String = ""
	for c in str{
		arr.append(c)
	}
	return arr
}

extension Array where Element == Character{
	func chooseDrop(index:Int)->Array<Character>{
		var str = self
		str.remove(at:index)
		return str
	}
}

extension Int{
	init?(_ arr:Array<Character>){
		
		var arr:Array<Character> = arr
		while arr[0] == "0"{
			if arr.count == 1{
				break
			}
			arr.remove(at:0)
		}
		var str:String = chararrtos(arr)
		self.init(str)
		
	}
}

func isSosu(_ nums:Array<Character>)->Bool{
	var nums = nums
	var tempNum = Int(nums)!
	if(tempNum < 10){
		if Int(nums)! == 2 || Int(nums)! == 3 || Int(nums)! == 5 || Int(nums)! == 7{
			return true
		}
		else{
			return false
		}
	}
	if nums.last! == "1" || nums.last! == "3" || nums.last! == "7" || nums.last! == "9"{
		for i in 2..<tempNum{
			if tempNum % i == 0{
				return false
			}
		}
		return true
	}
	return false
    
}

func findSosus(_ root:Array<Character>,_ nums:Array<Character>,_ sosus:inout Dictionary<Int,Bool>,_ count: inout Int){
	var nums = nums
	if nums.count == 0 { return }
	var root = root
	for i in 0..<nums.count{
		root.append(nums[i])
		if isSosu(root) && sosus[Int(root)!] == nil{
			count+=1
		}
		sosus[Int(root)!] = true
		findSosus(root,nums.chooseDrop(index:i),&sosus,&count)
		root.popLast()
	}
	return
}


func solution(_ numbers:String) -> Int {
    var sosus:Dictionary<Int,Bool> = Dictionary<Int,Bool>()
    var root:Array<Character> = Array<Character>()
    var nums:Array<Character> = stochararr(numbers)
    var count:Int = 0
    findSosus(root,nums,&sosus,&count)
    return count
}
