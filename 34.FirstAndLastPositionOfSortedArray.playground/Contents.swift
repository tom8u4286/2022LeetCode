
13/2


func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result = [-1,-1]
    if nums.count == 0 {
        return result
    }
    
    var low = 0
    var high = nums.count - 1
    
    // 找出target的最左側。
    while(low < high){
        print("----------------")
        
        let mid = (low + high) / 2
        print("low:\(low), mid:\(mid) high:\(high)")
        print("nums[\(low)]:\(nums[low]) num[\(mid)]:\(nums[mid]) nums[\(high)]:\(nums[high])")
        
        if nums[mid] < target {
            print("發現nums[mid]小於target，將low改為mid。")
            low = mid + 1
        } else {
            print("發現nums[mid]大於target，將high改為mid-1。")
            high = mid
        }
    }
    if nums[low] != target {
        return result
    }
    
    result[0] = low
    high = nums.count - 1
    
    
    // 找出target的最右側
    while(low < high){
        print("----------------")
        
        let mid = (low + high) / 2 + 1
        
        print("low:\(low), mid:\(mid) high:\(high)")
        print("nums[\(low)]:\(nums[low]) num[\(mid)]:\(nums[mid]) nums[\(high)]:\(nums[high])")
        
        if nums[mid] == target {
            print("發現nums[mid]等於target，將low改為mid。")
            low = mid
        }
        if nums[mid] < target {
            print("發現nums[mid]小於target，將low改為mid+1。")
            low = mid + 1
        }
        if nums[mid] > target {
            print("發現nums[mid]大於target，將high改為mid-1。")
            high = mid - 1
        }
        
    }
   
    result[1] = low
   
    return result
}

let arr:[Int] = []
print(searchRange(arr, 6))



