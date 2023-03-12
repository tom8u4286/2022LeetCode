import UIKit

//let s = "pwwkew"
let s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ "
s.count

//type(of: s.first)
//s.last

//type(of: s[s.startIndex])
//type(of: s[s.index(s.startIndex, offsetBy: 2)])

//s.count

// 判斷是否包含某char
//s.contains("\(s[s.startIndex])")

// 在以下for迴圈的處理中，觀察到最大數量的字串
var maxCount = 1

for round in 0...s.count-1 {
    
    /** 本輪要處理的字串。
     *  說明：
     *  類似SlidingWindow的概念，每一輪都會少掉最開頭的字母。
     *  比如字串"abc"，
     *  第一輪處理的是"abc"，第二輪是"bc"，第三輪是"c"。
     */
    let thisRoundString = s.dropFirst(round)
    print("=======新一輪=======")
    print("thisRoundString: \(thisRoundString)")
    
    var elementArray: [Character] = []
    elementArray.append(thisRoundString[thisRoundString.startIndex])

    // 如果這一輪剩餘的字母數量，已經與maxCount小於或相等
    let remainCharCount = s.count - round
    if remainCharCount < maxCount || remainCharCount == 1{
        break
    }
    
    for i in 1...thisRoundString.count-1 {
        // 本輪的字母
        let currentChar = thisRoundString[thisRoundString.index(thisRoundString.startIndex, offsetBy: i)]
        // 檢查先前累積的字串，是否已包含本字母
        // 若包含，則結束本輪。
        if elementArray.contains(currentChar) {
            // 如果本輪累積的字母數量已經大於先前最多，更改最大數量
            if elementArray.count > maxCount {
                maxCount = elementArray.count
            }
            break
        } else {
            elementArray.append(currentChar)
            if elementArray.count > maxCount {
                maxCount = elementArray.count
            }
        }
    }
    
    print(elementArray)
    
}

print("✅ 處理結束: \(maxCount)")

