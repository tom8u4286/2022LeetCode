


func threeSum(_ nums: [Int]) -> [[Int]] {
    // 首先將arr進行排序
    var arr = nums.sorted()
    
    var lastNum: Int? = nil
    
    var result: [[Int]] = []
    
    for i in 0..<arr.count {
        
        print("🛎🛎🛎🛎 本輪while開始，i:\(arr[i]) 🛎🛎🛎🛎")
        // 如果發現此輪的數字與前一輪相同，直接跳過此論，避免找到相同組合結果。
        if lastNum == arr[i]{
            continue
        }
        lastNum = arr[i]
        
        print("Array(arr[i...]):\(Array(arr[i...]))")
        let sliceNum = i + 1
        var twoNums = twoSum(Array(arr[sliceNum...]), arr[i] * (-1))
        // 如果未找到，則i前往下一個數字
        if twoNums == nil {
            continue
        // 如果找到，則在結果陣列中加入本結果
        } else {
            for res in twoNums! {
                var temp = res
                temp.insert(arr[i], at: 0)
                print("✅ 找到一組結果: \(temp)")
                result.append(temp)
            }
            
        }
        
    }
    
    return result

}

func twoSum(_ sortedNums: [Int], _ target: Int) -> [[Int]]?{
    var front = 0
    var tail = sortedNums.count - 1

    var result:[[Int]] = []
    
    print("===== 開始twoSum 目標:\(target)===== ")
    while(front < tail){
        print("---front:\(sortedNums[front]) tail:\(sortedNums[tail])---")
        if front > 0 && sortedNums[front-1] == sortedNums[front] {
            print("發現front與前一輪相同 front:\(sortedNums[front])，front += 1 進行下一輪。")
            front += 1
            continue
        }
        
        let sum = sortedNums[front] + sortedNums[tail]
        print("sum: \(sortedNums[front]) + \(sortedNums[tail]) = \(sum)")
        // 如果相加不夠大，front往前進一格
        if sum < target {
            print("不夠大 front += 1 ")
            front += 1
            
        // 如果相加太大，tail往後退一格
        } else if sum > target {
            print("太大 tail -= 1")
            tail -= 1
        
        // 如果相加相等，則找到答案
        } else {
            print("找到結果 \([sortedNums[front], sortedNums[tail]])")
            result.append([sortedNums[front], sortedNums[tail]])
            front += 1
        }
    }
    
    return result
}



//threeSum([-1,0,1,2,-1,-4])
//threeSum([0,1,1])
//threeSum([0,0,0])
threeSum([1,2,-2,-1])

//twoSum([-4, -1, 0, 1, 2], 0)




//let array = [-4, -1, 0, 1, 2]
//let index = 1
//array[index...]
