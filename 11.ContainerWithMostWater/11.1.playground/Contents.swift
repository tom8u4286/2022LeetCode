

/** 此種解法時間複雜度過大。超時。
 *
 */
func maxArea(_ height: [Int]) -> Int {
    
    var totalArr = [Int]()
    
    for i in 0 ..< height.count - 1 {
        var thisRoundAnsArr = [Int]()
        
        for j in i+1 ..< height.count {
            let volume = (j - i) * min(height[i], height[j])
            thisRoundAnsArr.append(volume)
        }
        /** 由於題目確認不會給空Array，因此確定thisRoundAnsArr一定有值。
         *
         */
        totalArr.append(thisRoundAnsArr.max()!)
    }
    
    return totalArr.max()!
}



//let input = [1,8,6,2,5,4,8,3,7]
let input = [1,1]

maxArea(input)

