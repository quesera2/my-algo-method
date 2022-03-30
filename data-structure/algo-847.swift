// Q4. デック
// https://algo-method.com/tasks/847

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
    case pushTail(Node)
    case popHead
    case popTail
}

func parseQuery() -> Operation {
    let input = readLine()!.split(separator: " ")
    let ope = Int(input[0])!
    let creteNode = { Node(String(input[1]))  }
    switch ope {
    case 0:
        return .pushHead(creteNode())
    case 1:
        return .pushTail(creteNode())
    case 2:
        return .popHead
    case 3:
        return .popTail
    default:
        fatalError()
    }
}

var head: Node? = nil
var tail: Node? = nil

func pushHead(_ node: Node) {
    head?.previous = node
    node.next = head
    head = node
    if tail == nil {
        tail = node
    }
}

func pushTail(_ node: Node) {
    tail?.next = node
    node.previous = tail
    tail = node
    if head == nil {
        head = node
    }
}

func popHead() {
    print(head?.value ?? "Error")
    head = head?.next
    head?.previous = nil
    if head == nil {
        tail = nil
    }
}

func popTail() {
    print(tail?.value ?? "Error")
    tail = tail?.previous
    tail?.next = nil
    if tail == nil {
        head = nil
    }
}

let q = Int(readLine()!)!
for _ in (0..<q) {
    switch parseQuery() {
    case .pushHead(let node):
        pushHead(node)
    case .pushTail(let node):
        pushTail(node)
    case .popHead:
        popHead()
    case .popTail:
        popTail()
    }
}