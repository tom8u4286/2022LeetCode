


false && false || true




func generateParenthesis(_ n: Int) -> [String] {
    var res: [String] = []


    func backtrack(_ path: [String], _ target: Int) {
        print("======== 開始backtrack: path:\(path), target:\(target) ========")
        var path = path
        var count = 0

        print("path.count:\(path.count), n*2:\(n*2)")
        if path.count == n * 2 {
            print("發現path.count == n*2!")
            var string = ""
            for s in path { string += s }
            print("string:\(string)")
            print("✅ 結束 return!")
            res.append(string)
            return
        }

        // 檢查path中有幾個"("
        for c in path where c == "(" { count += 1 }
        print("目前(的數量為:\(count)")
        
        for c in ["(", ")"] {
            /** (c == "(" && count >= n) 表示：
             * 前括號"("的數量已等於n。
             * path.count - count >= count表示：
             *
             */
            if (c == "(" && count >= n) || (c == ")" && path.count - count >= count)  {
                if c == "(" && count >= n {
                    print("發現c == ( && count >= n , c:\(c) countinue!")
                }
                if c == ")" && path.count - count >= count {
                    print("c == ) && path.count - count >= count , c:\(c) countinue!")
                }
                continue
            }
            print("path中加入:\(c)")
            path.append(c)
            print("向下backtrack。")
            backtrack(path, target - 1)
            
            path.remove(at: path.count - 1)
            print("path.remove: path:\(path)")
        }
    }

    backtrack([], n * 2)
    return res
}

generateParenthesis(1)


//let s = "abcabcbb"
//
//var arr: [String] = []
//
//for ch in s {
//
//    if !arr.contains(String(ch)) {
//        print("加入:\(ch)")
//        arr.append(String(ch))
//    }
//
//}
//
//arr.joined()

