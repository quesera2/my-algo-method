// 括弧列の対応関係 (2)
// https://algo-method.com/tasks/890

let N = Int(readLine()!)!
let S = readLine()!

struct Stack<T> {
    var items:[T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stack = Stack<Int>()
var result: [Int:Int] = [:]

for (index, s) in S.enumerated() {    
    if s == "(" {
        stack.push(index)
    } else if s == ")" {
        let popIndex = stack.pop()
        result[index] = popIndex
        result[popIndex] = index
    }
}

let Q = Int(readLine()!)!
for _ in (0..<Q) {
    let q = Int(readLine()!)!
    print(result[q]!)
}
