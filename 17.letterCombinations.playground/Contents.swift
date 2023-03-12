

[1,2,3] + [4,5,6]


func letterCombinations(_ digits: String) -> [String] {
    
    if digits.count == 0 {
        return []
    }
    
    let dict = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "o", "n"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"],
    ]
    
    var result: [String] = []
    
    for round in 0..<digits.count{
        let digit = String(digits[digits.index(digits.startIndex, offsetBy: round)])
        
        guard let charSet = dict[digit] else {
            print("dict中找不到字母組合。")
            return []
        }
        
        // 第一輪，直接assign該數字組合
        if round == 0 {
            result = charSet
            continue
        }
        
        let origin = result
        
        var temp: [String] = []
        for char in charSet {
            temp = temp + origin.map({ $0 + char })
        }
        
        result = temp
        
    }
    
    return result
}

letterCombinations("")


