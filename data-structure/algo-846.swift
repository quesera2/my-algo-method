// Q3. キュー
// https://algo-method.com/tasks/846

final class Node {
    let value: String
    var previous: Node? = nil
    var next: Node? = nil

    init(_ value: String) {
        self.value = value
    }
}

enum Operation {
    case pushHead(Node)
    case popTail
}

func parseQuery() -> Operation {
    let input = readLine()!.split(separator: " ")
    let ope = Int(input[0])!
    if ope == 0 {
        return .pushHead(Node(String(input[1])))
    } else if ope == 1 {
        return .popTail
    } else {
        fatalError()
    }
}

var head: Node? = nil
var tail: Node? = nil

func pushHead(_ node: Node) {
    node.previous = head
    node.previous?.next = node
    head = node

    if tail == nil {
        tail = node
    }
}

func popTail() {
    if let current = tail {
        print(current.value)
        tail = current.next
    } else {
        print("Error")
    }
}

let q = Int(readLine()!)!
for _ in (0..<q) {
    switch parseQuery() {
    case .pushHead(let node):
        pushHead(node)
    case .popTail:
        popTail()
    }
}
