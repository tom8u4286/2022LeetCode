
func maxArea(_ height: [Int]) -> Int {
    
    var volume = 0
    
    var i = 0
    var j = height.count-1
    
    while( i < j ){
        volume = max(volume, (j - i) * min(height[i], height[j]))
        
        if height[i] > height[j]{
            j -= 1
        } else {
            i += 1
        }
    }
    
    return volume
}

//let input = [1,8,6,2,5,4,8,3,7]
let input = [1,1]

maxArea(input)
