// 括弧列の整合性判定
// https://algo-method.com/tasks/888

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

    func count() -> Int {
        return items.count
    }
}

var stack = Stack<Int>()
var result: [Int:Int] = [:]
var flag = true

for (index, s) in S.enumerated() {    
    if s == "(" {
        stack.push(index)
    } else if s == ")" {
        if stack.count() == 0 {
            flag = false
            break
        }
        let popIndex = stack.pop()
        result[popIndex] = index
        result[index] = popIndex
    }
}

if stack.count() != 0 {
    flag = false
}

print(flag ? "Yes" : "No")
