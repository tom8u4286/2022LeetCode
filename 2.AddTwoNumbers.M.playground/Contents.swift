import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        /** 確認l1與l2都不是nil，
         * 1. 如果皆為nil，return nil
         * 2. 如果其一為nil，則return另一
         * 3. 如果皆有值，才開始進行運算。
         */
        if l1 == nil && l2 == nil {return nil}
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        /** 通過上面的檢查，表示兩ListNode皆有值，不是空的Link list。
         */
        var newList: ListNode?
        // 在第一個節點被創建時，要記錄第一個Node，於運算結束後回傳。
        var headList: ListNode?
        
        var tmpL1 = l1
        var tmpL2 = l2
        // 進位
        var carry = false
        
        while(true){
            var value = tmpL1!.val + tmpL2!.val
            // 如果前一個節點相加有進位，此處加上進位的1。
            if carry {
                value += 1
                carry = false
            }
            
            // 如果數值超過10，進位
            if(value > 9) {
                carry = true
                value %= 10
            }
            // 以此value建構一個新Node
            let tmpNode = ListNode(value)
            
            // 如果newList還沒有值，表示這個node是第一個節點
            if newList == nil {
                newList = tmpNode
                headList = tmpNode
                
            /** 如果newList有值了，將newList當前節點的next點指向tmpNode。
             * 再將ListNode指向tmpNode。
             */
            } else {
                newList?.next = tmpNode
                newList = tmpNode
            }
            
            /** 如果兩鏈結都沒有下一個節點，
             * 表示運算結束，離開while迴圈。
             */
            if(tmpL1?.next == nil && tmpL2?.next == nil){
                /** 如果在兩鏈結都結尾時，仍有一個進位，
                 * 新增一個value為1的節點接在最後。
                 */
                if(carry){
                    newList?.next = ListNode(1)
                }
                break
            }
            
            /** 如果其一鏈結為nil，
             * 1. 先檢查是否有進位，有進位的話要再新增一個value為1的節點，給下一輪運算。
             * 2. 如果沒有進位，表示運算結束。將newList的next指向另一鏈結的next。
             */
            if(tmpL1?.next == nil){
                // 如果還有進位
                if(carry){
                    tmpL1?.next = ListNode(1)
                    tmpL1 = tmpL1?.next
                    tmpL2 = tmpL2?.next
                    /** 在某節點結尾時，仍有進位的狀況較特殊，
                     * 比須將carry設定為false，否則將會在下一輪的carry判斷中，又再加一次進位的1。
                     */
                    carry = false
                    continue
                }
                /** 如果沒有進位，表示所有運算已經完結，
                 * 將newList的next指向另一鏈結的next。
                 */
                newList?.next = tmpL2?.next
                break
            }
            if(tmpL2?.next == nil){
                // 如果還有進位
                if(carry){
                    tmpL2?.next = ListNode(1)
                    tmpL1 = tmpL1?.next
                    tmpL2 = tmpL2?.next
                    /** 在某節點結尾時，仍有進位的狀況較特殊，
                     * 比須將carry設定為false，否則將會在下一輪的carry判斷中，又再加一次進位的1。
                     */
                    carry = false
                    continue
                }
                /** 如果沒有進位，表示所有運算已經完結，
                 * 將newList的next指向另一鏈結的next。
                 */
                newList?.next = tmpL1?.next
                break
            }
            
            // 如果tmpL1與tmpL2的next都有還有節點，則兩LinkList都指向下一節點
            tmpL1 = tmpL1?.next
            tmpL2 = tmpL2?.next
            
        }
        
        return headList
    }
    
    // 將List轉換為Int數字
    func getListNumber(_ node: ListNode?) -> Int{
        guard node != nil else { return 0 }
        
        var tempNum = node!.val
    
        // while迴圈目前跑到的node
        var currentNode = node
        
        // while回圈，每輪指數要加一
        var index = 0.0
        
        while(currentNode!.next != nil){
            currentNode = currentNode!.next
            index += 1
            
            tempNum += Int( Double(currentNode!.val) * pow(10.0, Double(index)) )
        }
        
        return tempNum
    }
    
    // 將int轉換為LinkedList
    func intToList(num: Int) -> ListNode{
        // 如果數字為0，回傳一個0的Node
        if num == 0 {return ListNode()}
        
        var arr = [Int]()
        var temp = num
        while(temp > 0){
            if( temp < 10 ){
                arr.append(temp)
                break
            }
            
            arr.append(temp % 10)
            temp /= 10
        }
        
        var currentNode: ListNode?
        // 目前回圈跑到的array index
        var index = arr.count - 1
        while( 0 <= index){
            let num = arr[index]
            currentNode = ListNode(num, currentNode)

            index -= 1
        }
        
        return currentNode!
    }
}

// l1 = [2,4,3], l2 = [5,6,4]
//let node13 = ListNode(3)
//let node12 = ListNode(4, node13)
//let node11 = ListNode(2, node12)

// 9,9,9,9,9,9,9
let node17 = ListNode(9)
let node16 = ListNode(9, node17)
let node15 = ListNode(9, node16)
let node14 = ListNode(9, node15)
let node13 = ListNode(9, node14)
let node12 = ListNode(9, node13)
let node11 = ListNode(9, node12)


//let node23 = ListNode(4)
//let node22 = ListNode(6, node23)
//let node21 = ListNode(5, node22)

// 9,9,9,9
let node24 = ListNode(9)
let node23 = ListNode(9, node24)
let node22 = ListNode(9, node23)
let node21 = ListNode(9, node22)


let sol = Solution()
//sol.intToList(num: 0)

var node = sol.addTwoNumbers(node11, node21)

while(node != nil){
    print(node?.val)
    node = node?.next
}


