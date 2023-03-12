
func naivePalindrome(_ s: String) -> String {
    
    var result = ""
    
    for round in 0 ..< s.count {
        // 測驗單數字母的Palindrome
        let thisRoundResult = helper(s: s, l: round, r: round)
        if (thisRoundResult.count > result.count){
            result = thisRoundResult
        }
    }
    for round in 0 ..< s.count - 1{
        // 測驗單數字母的Palindrome
        let thisRoundResult = helper(s: s, l: round, r: round + 1)
        if (thisRoundResult.count > result.count){
            result = thisRoundResult
        }
    }
    
    return result
    
}

func helper(s: String, l:Int, r: Int) -> String {
    var result = ""

    var rightPointer = r
    var leftPointer = l
//    print("=======開始helper=======")
    
    while(leftPointer >= 0 && rightPointer < s.count){
        let leftIndex = s.index(s.startIndex, offsetBy: leftPointer)
        let rightIndex = s.index(s.startIndex, offsetBy: rightPointer)
        
//        print("左: \(s[leftIndex])  右: \(s[rightIndex])")

        let substringLength = rightPointer - leftPointer + 1
        // 如果左pointer的字母與右pointer的字母一樣，表示為Palindrome
        if( s[leftIndex] == s[rightIndex] ){
            if (substringLength > result.count){
                
                // prefix會包含該index的字母
                let temp = s.prefix(upTo: s.index(s.startIndex, offsetBy: rightPointer + 1))
                let roundString = temp.suffix(from: s.index(s.startIndex, offsetBy: leftPointer))
                
                let newString = String(roundString)
//                print("✅ 發現比原先的長，替換！原：\(result) 改為：\(newString)")
                result = newString
            }

            // 左右+1，檢查下一個字母
            rightPointer += 1
            leftPointer -= 1
        } else {
//            print("左右已不一樣，結束本輪helper。")
            break
        }
    }
    
    return result

}

func checkIfContainsOnlyChar(_ s: String) -> Bool{
    for i in 0..<s.count{
        let stringIndex = s.index(s.startIndex, offsetBy: i)
        // 如果發現有字母不等於第一個字母，回傳false
        if s[s.startIndex] != s[stringIndex]{
            print("在第\(i)個字母發現不一樣。")
            return false
        }
    }
    return true
}


//let input = "babad"
//let input = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
//input.prefix(upTo: input.index(input.startIndex, offsetBy: 0))
//input.suffix(from: input.index(input.startIndex, offsetBy: 1))
//let input = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"
//let input = "cbbddbbc"

//let input = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabcaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

let input = "zbkksfgesmfyuedjxdtknclymgskfjduhfocipzjqnmvcodjlvlagmhokqfeudickyeoobmkerjdeloxfbauryanltprloaeboavxzltgcurgbtgtpygpjizoopwmwjixaowppdvkferupefhwombszifyliidrxpxgcpbfzqtxdfiwfmtgvjiccrigwljrlvhaegvbitngckdnsfcnqlgykwjmsifcttcbeummaoidrrhkxmxctugcrlpbiolzqnjtwhzreruglrdvzioewcgvjjwfyqmhupusktptvfpcqxkvpbrlzchtacmlzgeejnvjzzhcegwtwqhimwooflzeiomeqyrnaeiquolmsunqrgffkpljewyritkivdrfnovbatdstypzsmbjdrromcqexnmjcuqpjzzjpqucjmnxeqcmorrdjbmszpytsdtabvonfrdviktirywejlpkffgrqnusmlouqieanryqemoiezlfoowmihqwtwgechzzjvnjeegzlmcathczlrbpvkxqcpfvtptksupuhmqyfwjjvgcweoizvdrlgurerzhwtjnqzloibplrcgutcxmxkhrrdioammuebcttcfismjwkyglqncfsndkcgntibvgeahvlrjlwgirccijvgtmfwifdxtqzfbpcgxpxrdiilyfizsbmowhfepurefkvdppwoaxijwmwpoozijpgyptgtbgrucgtlzxvaobeaolrptlnayruabfxoledjrekmbooeykciduefqkohmgalvljdocvmnqjzpicofhudjfksgmylcnktdxjdeuyfmsegfskkbz"


//input.index(input.startIndex, offsetBy: 1)

//naivePalindrome(input)

//let input = "eeeede"
checkIfContainsOnlyChar(input)

//helper(input)
