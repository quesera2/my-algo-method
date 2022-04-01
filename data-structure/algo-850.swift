// Q6. ままこだて (2)
// https://algo-method.com/tasks/850
// ままこだてを連結リストを使って解くバージョン
import Foundation

let N = Int(readLine()!)!

class Node {
    let value: Int
    var next: Node?
    var previous: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}

// 2以下の場合を除外
if N < 3 {
    print(N)
    exit(0)
}

// 双方向ノードのままこだてを作成
var root = Node(1)
var previous: Node = root
for i in (2...N) {
    let newNode = Node(i)
    newNode.previous = previous
    previous.next = newNode
    previous = newNode
}
// 循環にする
root.previous = previous
previous.next = root

// ひとつずつ消していく
var node: Node = root
while true {
    if node.next === node {
        break
    }
    node.previous?.next = node.next
    node.next?.previous = node.previous
    node = node.next!.next!
}

print(node.value)