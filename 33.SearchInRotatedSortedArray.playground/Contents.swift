

func search(_ nums: [Int], _ target: Int) -> Int {
    print(nums)
    if nums.isEmpty { return -1 }
    if nums.count == 1 {
        if nums.contains(target){
            return 0
        } else {
            return -1
        }
    }
    
    
    let firstValue = nums[0]
    let midValue = nums[ nums.count / 2 ]
    let lastValue = nums[ nums.count - 1 ]
    
    print("開始搜索！ firstValue:\(firstValue) midValue:\(midValue) lastValue:\(lastValue)")
    
    if midValue > firstValue {
        print("中間值比firstValue還大。 執行leftMore。")
        return leftMore(nums: nums, firstValue: firstValue, midValue: midValue, lastValue: lastValue, target: target)
    } else {
        print("中間值比firstValue還小。 執行rightMore。")
        return rightMore(nums: nums, firstValue: firstValue, midValue: midValue, lastValue: lastValue, target: target)
    }
    
}

func leftMore(nums:[Int], firstValue:Int, midValue:Int, lastValue:Int, target:Int) -> Int{
    /** 如果目標比中間值還大，從中間值往後找。
     *
     */
    if target > midValue {
        print("Target > midValue")
        var pointer = nums.count/2
        while(true){
            print("pointer:\(pointer)")
            if nums[pointer] == target {
                return pointer
            } else {
                pointer += 1
                // 如果pointer已經等於長度，表示array搜索完沒有找到
                if pointer == nums.count {
                    return -1
                }
                // 如果pointer的值比target還小，表示已經找到底，一定找不到了。
                if nums[pointer] < firstValue {
                    return -1
                }
            }
        }
    }
    
    if target <= midValue && target >= nums[0]{
        print("Target <= midValue 且 target>= nums[0]")
        // 如果mid與target的距離比較近，從mid往回找
        if abs(midValue - target) <= abs(target - firstValue){
            print("發現與target與midValue比較接近。")
            var pointer = nums.count/2
            
            while(nums[pointer] >= target){
                if nums[pointer] == target {
                    return pointer
                }
                pointer -= 1
                // 如果pointer已經減到為-1，確定找不到
                if pointer < 0 {
                    return -1
                }
            }
            
        // 如果nums[0]與target的距離比較近，從頭往後找
        }else {
            print("發現與target與firstValue比較接近。")
            var pointer = 0
            
            while(target >= nums[pointer] ){
                
                if target == nums[pointer] {
                    return pointer
                }
                pointer += 1
                // 如果pointer已經加到中間值，確定找不到
                if nums[pointer] > midValue {
                    return -1
                }
            }
        }
    }
    

    if target <= lastValue {
        print("target <= lastValue")
        
        var pointer = nums.count - 1
        while(target <= nums[pointer]){
            print("target:\(target) pointer:\(pointer) nums[pointer]:\(nums[pointer])")
            if target == nums[pointer]{
                return pointer
            } else {
                pointer -= 1
                
                if pointer < 0 {
                    return -1
                }
                // 如果發現nums[pointer]忽然大於target，表示已經找不到
                if nums[pointer] > lastValue {
                    return -1
                }
            }
        }
    }
    
    return -1
}

func rightMore(nums:[Int], firstValue:Int, midValue:Int, lastValue:Int, target:Int) -> Int{
    
    // 如果target大於firstValue，表示target在left區。
    if target >= firstValue {
        print("target >= firstValue。")
        var pointer = 0
        
        while target >= nums[pointer] {
            print("pointer: \(pointer)")
            if target == nums[pointer] {
                return pointer
            } else {
                if pointer == nums.count/2 {
                    return -1
                }
                pointer += 1
            }
        }
        
        // while迴圈跑完沒找到，表示找不到了
        return -1
    }
    
    // 看target接近midValue還是lastValue，
    // 如果接近midValue，則從midValue往後找。
    // 如果接近lastValue，則從lastValue往前找。
    if target >= midValue {
        print("target >= 中間值。")
        // 如果接近midValue，則從midValue往後找。
        if abs(midValue - target) <= abs(target - lastValue){
            var pointer = nums.count/2
            
            while target >= nums[pointer] {
                print("pointer:\(pointer)")
                if target == nums[pointer]{
                    return pointer
                } else {
                    print("pointer 加 1")
                    if pointer == nums.count - 1 {
                        return -1
                    }
                    pointer += 1
                    
                }
            }
            
            // while迴圈跑完沒找到，表示找不到了
            return -1
        
        // 如果接近lastValue，則從lastValue往前找。
        } else {
            var pointer = nums.count - 1
            
            while(target <= nums[pointer]){
                if target == nums[pointer]{
                    return pointer
                } else {
                    pointer -= 1
                }
            }
            // while迴圈跑完沒找到，表示找不到了
            return -1
        }
        
    }
    
    // 從midValue往前找
    if target < midValue {
        print("target < 中間值。")
        var pointer = nums.count / 2
        
        while target <= nums[pointer] {
            print("pointer: \(pointer)")
            if target == nums[pointer]{
                return pointer
            } else {
                if pointer == 0 {
                    return -1
                }
                pointer -= 1
            }
        }
        // while迴圈跑完沒找到，表示找不到了
        return -1
    }
    
    return -1
}


//let inputNums = [4,5,6,7,0,1,2]
//let inputNums = [7,8,1,2,3,4,5,6]
//let inputNums = [3,1]
let inputNums = [1,2,3,4,5]


//[1,2,3,4,5]
//[2,3,4,5,1]
//[4,5,6,7,0,1,2]
// 1. 如果midValue > firstValue，表示左多
// 2. 如果midValue < firstValue，表示右多



search(inputNums, 5)

