// タスクリスト(1)
// https://algo-method.com/tasks/882
final class Node<T> {
    var value: T
    var next: Node<T>? = nil
    init(value: T) {
        self.value = value 
    }
}

final class Queue<T> {
    private var head: Node<T>? = nil
    private var tail: Node<T>? = nil

    init() { }

    func append(_ newElement: T) {
        let oldTail = tail
        self.tail = Node(value: newElement)
        if  head == nil { head = tail }
        else { oldTail?.next = self.tail }
    }

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

var queue = Queue<String>()
let Q = Int(readLine()!)!
for q in (0..<Q) {
    let input = readLine()!.split(separator: " ").map { String($0) }
    switch input[0] {
        case "0":
            queue.append(input[1])
        case "1":
            print(queue.dequeue()!)
        default:
            continue
    }
}
