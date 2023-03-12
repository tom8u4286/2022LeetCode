import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return 1
    }
    
    var uniqueNums: [Int] = [nums[0]]
    var count = 0
    
    var temp = nums[0]
    
    for i in 1..<nums.count {
        if nums[i] == temp {
            count += 1
        } else {
            temp = nums[i]
            uniqueNums.append(temp)
        }
    }
    
    for i in 0..<uniqueNums.count {
        nums[i] = uniqueNums[i]
    }
    
    return count
}

//var input = [0,0,1,1,1,2,2,3,3,4]
var input = [1,1,2]
removeDuplicates(&input)
input
