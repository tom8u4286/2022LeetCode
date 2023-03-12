import UIKit

//var s = "babad"
//var s = "cabacd"
//var s = "cbbd"
//var s = "abbb"
//var s = "cbbd"
//var s = "aaaa"
//var s = "a"
//var s = "aacabdkacaa"
//var s = "xaabacxcabaaxcabaax"
var s = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"


s.count

var longestString = ""

// 處理空字串
//if s.count == 0 { return ""}
// 處理只有一個字母
//if s.count == 1 { return s }

print("字串:\(s)")
print("================開始進行有中央字母找法================")
// 第一個loop找尋有中字母的情行
for round in 0...s.count-1 {
    let thisRoundChar = s[s.index(s.startIndex, offsetBy: round)]
    print("==========\(thisRoundChar)==========")
    print("round:\(round)")
    // 如果已進行到最後一字母
    if round == s.count-1 {
        print("已進行到最後一字母，break")
        if longestString.count == 1 {
//            return longestString
        }
        break
    }
    // 本輪字母前的字母數，與本輪字母厚的字母數，取小
    let numBeforeChar = round
    let numAfterChar = (s.count - 1) - round
    print("前有：\(numBeforeChar) 後有：\(numAfterChar)")
    let loopNum = min(numBeforeChar, numAfterChar)
    print("應取：\(loopNum)")
    if loopNum == 0 {
        longestString = "\(thisRoundChar)"
        continue
    }
    for num in 1...loopNum {
        print("------------")
        let charBefore = s[s.index(s.startIndex, offsetBy: round - num)]
        let charAfter = s[s.index(s.startIndex, offsetBy: round + num)]
        print("前字母: \(charBefore)   後字母: \(charAfter)")
        // 如果前後字母相同，為合法字串。如果此字串又比先前最長的字串還長，取代之
        if charBefore == charAfter {
            // 切掉後面
            var currentString = s.dropLast(s.count-(round+1)-num)
            // 切掉前面
            currentString = currentString.dropFirst(round - num)
            print("currentString: \(currentString)")
            // 如果本
            if currentString.count > longestString.count {
                print("發現currentString比longestString還長，取代。")
                longestString = "\(currentString)"
            }
        } else {
            break
        }
    }
}
print("有中央找法的最長字串:\(longestString)")
print("")
print("")
var longestString2 = ""

print("字串:\(s)")
print("================開始進行無中央字母找法================")
// 第二個loop找沒有中央字母的情形
for round in 0...s.count-1 {
    let thisRoundChar = s[s.index(s.startIndex, offsetBy: round)]
    print("==========round:\(round) 字母:\(thisRoundChar)==========")
    // 如果已進行到最後一字母
    if round == s.count-1 {
        print("已進行到最後一字母，break")
        if longestString2.count == 1 {
        }
        break
    }
    // 如果下一個字母與本輪字母不同，直接continue
    if thisRoundChar != s[s.index(s.startIndex, offsetBy: round + 1)] {
        print("發現下一個字母不同，跳過此輪。 下一字母為: \(s[s.index(s.startIndex, offsetBy: round + 1)])")
        continue
    }
    
    if longestString2.count == 0 {
        longestString2 = "\(thisRoundChar)\(thisRoundChar)"
    }
    
    // 本輪字母前的字母數，與本輪字母厚的字母數，取小
    let numBeforeChar = round
    let numAfterChar = (s.count - 1) - round - 1
    print("前有：\(numBeforeChar) 後有：\(numAfterChar)")
    let loopNum = min(numBeforeChar, numAfterChar)
    print("應取：\(loopNum)")
    if loopNum == 0 {
        if longestString2.count <= 1 {
            longestString2 = "\(thisRoundChar)"
        }
        continue
    }
    
    for num in 1...loopNum {
        print("------------")
        let charBefore = s[s.index(s.startIndex, offsetBy: round - num)]
        let charAfter = s[s.index(s.startIndex, offsetBy: (round + 1) + num)]
        print("前字母: \(charBefore)   後字母: \(charAfter)")
        // 如果前後字母相同，為合法字串。如果此字串又比先前最長的字串還長，取代之
        if charBefore == charAfter {
            // 切掉後面
            var currentString = s.dropLast((s.count-1)-(round+1)-num)
            // 切掉前面
            currentString = currentString.dropFirst(round - num)
            print("currentString: \(currentString)")
            // 如果本
            if currentString.count > longestString2.count {
                print("發現currentString比longestString還長，取代。")
                longestString2 = "\(currentString)"
            }
        } else {
            break
        }
    }
}

let result = longestString2.count > longestString.count ? longestString2 : longestString
print("結果：\(result)")
