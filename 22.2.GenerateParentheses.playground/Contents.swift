import UIKit


func generateParenthesis(_ n: Int) -> [String] {
    var res: [String] = []
    var stack: [String] = []

    func backtrack(_ openNum: Int, _ closeNum: Int) {
        print("=== 開始進行backtrack。 openNum:\(openNum) closeNum:\(closeNum) ===")
        
        if openNum == closeNum && closeNum == n {
            print("✅ openNum == closeNum == n , res加入:\(stack.joined())")
            res.append(stack.joined())
            return
        }
        
        if openNum < n {
            print("👍 openNum:\(openNum) closeNum:\(closeNum), 前括號少於N，Stack加入一個前括號 (")
            stack.append("(")
            backtrack(openNum + 1, closeNum)
            stack.popLast()
        }
        
        if closeNum < openNum {
            print("🌷 openNum:\(openNum) closeNum:\(closeNum), 後括號少於前括號，Stack加入一個後括號 )")
            stack.append(")")
            backtrack(openNum, closeNum + 1)
            stack.popLast()
        }
            
    }
    
    backtrack(0, 0)
    
    return res
}

generateParenthesis(2)

//var test = [1,2,3]
//test.popLast()
//test
