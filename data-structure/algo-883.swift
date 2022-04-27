// 逆ポーランド記法の計算
// https://algo-method.com/tasks/883

let input1 = readLine()!
let input2 = Int(readLine()!)!
let input3 = readLine()!.split(separator: " ").map { String($0) }

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
for v in input3 {
    if let num = Int(v) {
        stack.push(num)
    } else {
        let (right, left) = (stack.pop(), stack.pop())
        switch v {
            case "+":
            stack.push(left + right)
            case "-":
            stack.push(left - right)
            case "*":            
            stack.push(left * right)
            default:
            break
        }
    }
}

print("\(input1)=\(stack.pop())")
