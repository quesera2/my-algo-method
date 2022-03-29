// Q1. 連結リスト
// https://algo-method.com/tasks/844

@propertyWrapper
enum Indirect<T> {
  indirect case wrapped(T)
  
  var wrappedValue: T {
    get { switch self { case .wrapped(let x): return x } }
    set { self = .wrapped(newValue) }
  }
}

struct Node<T> {
  var value: T
  @Indirect var next: Self?
  
  init(_ value: T, next: Self? = nil) {
    self.value = value
    self._next = .wrapped(next)
  }
}

enum Operation {
    case insert(Node<String>)
    case output(Int)
}

func parseQuery() -> Operation {
    let input = readLine()!.split(separator: " ")
    let ope = Int(input[0])!
    if ope == 0 {
        return .insert(Node(String(input[1])))
    } else if ope == 1 {
        return .output(Int(input[1])!)
    } else {
        fatalError()
    }
}

var root: Node<String>? = nil
let q = Int(readLine()!)!
for _ in (0..<q) {
    switch parseQuery() {
        case .insert(var node):
            node.next = root
            root = node
        case .output(let index):
        var node = root
        for i in (0..<index) {
            if let current = node {
                print(current.value, terminator: " ")
                node = current.next
            } else {
                break
            }
        }
        print()
    }
}
