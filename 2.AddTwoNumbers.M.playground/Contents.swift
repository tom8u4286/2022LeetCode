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
        
        // 取得兩條ListNode的數字 並相加
        let sum = getListNumber(l1) + getListNumber(l2)
        
        // 將數字轉換回ListNode
        let result = intToList(num: sum)
        
        return result
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
//sol.getListNumber(node11)
//sol.getListNumber(node21)

//let test = Int(pow(10.0, 2.0))
//123%10
