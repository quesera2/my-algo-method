// キューを配列で実装
// https://algo-method.com/tasks/884

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

func inputIntArray() -> [Int] {
    return readLine()!.split(separator: " ").map { Int($0)! }
}


let (N, Q) = inputIntTuple()

class Queue {
    var data: [Int] = Array(repeating: -1, count: N)
    var head = 0
    var tail = 0

    func push(_ value: Int) {
        data[tail] = value
        tail += 1
        tail %= N
    }

    func pop() {
        data[head] = -1
        head += 1
        head %= N
    }

    func printData() {
        for value in data {
            print(value)
        }
    }
}

var queue = Queue()

for _ in (0..<Q) {
    let input = inputIntArray()
    switch input[0] {
        case 0:
            queue.push(input[1])
        case 1:
            queue.pop()
        default:
            continue
    }
}

queue.printData()
