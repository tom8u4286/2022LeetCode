

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    
    guard head != nil else { return head }
    
    var listLength = 1
    
    var pointer = head
    
    while true{
        if pointer!.next != nil {
            pointer = pointer!.next
            listLength += 1
        } else {
            break
        }
    }
    
    // 要刪除的node應為list的第幾個
    let index = listLength - n
    if index == 0 { return head?.next}
    
    var loopCount = 0
    // 要刪除節點的前一節點
    var frontNode: ListNode? = nil
    // 要刪除節點的後一節點
    var nextNode: ListNode? = nil
    
    var pointer2 = head
    while true {
        if loopCount == index - 1{
            frontNode = pointer2
        }
        if loopCount == index {
            nextNode = pointer2?.next
            break
        }
        loopCount += 1
        pointer2 = pointer2?.next
    }
    
    frontNode?.next = nextNode
    
    return head
}
