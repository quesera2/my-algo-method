// タスクリスト(2)
// https://algo-method.com/tasks/889
final class Node<T> {
    var value: T
    var next: Node<T>? = nil
    init(value: T) {
        self.value = value 
    }
}

final class Queue<T> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil

    init() { }

    func append(_ newElement: T) {
        let oldTail = tail
        self.tail = Node(value: newElement)
        if  head == nil { head = tail }
        else { oldTail?.next = self.tail }
    }

    @discardableResult
    func dequeue() -> T? {
        if let head = self.head {
            self.head = head.next
            if head.next == nil { tail = nil }
            return head.value
        }
        else {
            return nil
        }
    }
}

let X = Int(readLine()!)!
var queue = Queue<Int>()
let Q = Int(readLine()!)!
var taskCount = 0
for q in (0..<Q) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    switch input[0] {
        case 0:
            queue.append(input[1] + X)
        case 1:
            while true {
                if let value = queue.head?.value, value <= input[1] {
                    queue.dequeue()
                    taskCount += 1
                } else {
                    print(taskCount)
                    break
                }
            }
            
        default:
            continue
    }
}
