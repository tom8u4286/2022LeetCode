

Int("")







func reverse(_ x: Int) -> Int {
    
    if x == 0 { return 0 }
    
    print("input: \(x)")
    var tempNum = x
    
    let lessThanZero = tempNum < 0
    
    if lessThanZero {
        tempNum = x * (-1)
    }
    
    let reversedString = String(String(tempNum).reversed())
//    print("反轉字串:\(reversedString)")
    
    // 移除掉開頭的0
    let trimPrefixZero = reversedString.trimmingPrefix("0")
//    print("移除掉開頭的0: \(trimPrefixZero)")
    
    guard Int(trimPrefixZero) != nil else {
        print("🛑 字串無法轉成Int:\(trimPrefixZero)")
        return 0
    }
    
    if lessThanZero {
        tempNum = Int(trimPrefixZero)! * (-1)
    } else {
        tempNum = Int(trimPrefixZero)!
    }
    
    print("Ans:\(tempNum)")
    if tempNum >  2_147_483_647 || tempNum < -2_147_483_647{
        return 0
    }
    
    return tempNum
}

let input = 1534236469

reverse(input)
