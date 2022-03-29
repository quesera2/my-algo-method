// Q2. スタック (2)
// https://algo-method.com/tasks/845

final class Node {
    let value: String
    var previous: Node? = nil

    init(_ value: String) {
        self.value = value
    }
}

enum Operation {
    case pushHead(Node)
    case popHead
}

func parseQuery() -> Operation {
    let input = readLine()!.split(separator: " ")
    let ope = Int(input[0])!
    if ope == 0 {
        return .pushHead(Node(String(input[1])))
    } else if ope == 1 {
        return .popHead
    } else {
        fatalError()
    }
}

var head: Node? = nil

func pushHead(_ node: Node) {
    node.previous = head
    head = node
}

func popHead() {
    if let current = head {
        print(current.value)
        head = current.previous
    } else {
        print("Error")
    }
}

let q = Int(readLine()!)!
for _ in (0..<q) {
    switch parseQuery() {
    case .pushHead(let node):
        pushHead(node)
    case .popHead:
        popHead()
    }
}