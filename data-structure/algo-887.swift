// 括弧列の対応関係
// https://algo-method.com/tasks/887

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

for (index, s) in S.enumerated() {    
    if s == "(" {
        stack.push(index)
    } else if s == ")" {
        let popIndex = stack.pop()
        if popIndex == 0 {
            print(index)
            break
        }
    }
}
