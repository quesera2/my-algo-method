// 完全二分木の頂点番号
// https://algo-method.com/tasks/923

import Foundation

let H = Int(readLine()!)!
let Q = Int(readLine()!)!

var hasChildren = 0
for i in (0..<H) {
    hasChildren += Int(pow(2.0, Double(i)))
}

func inputIntTuple() -> (Int, Int) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    return (input[0], input[1])
}

func printParent(_ v: Int) {
    if (v == 0) {
        print(-1)
        return
    }

    print((v - 1) / 2)
}

func printLeftChild(_ v: Int) {    
    if !hasChild(v) {
        print(-1)
        return
    }

    print(v * 2 + 1)
}

func printRightChild(_ v: Int) {    
    if !hasChild(v) {
        print(-1)
        return
    }

    print(v * 2 + 2)
}

func hasChild(_ v: Int) -> Bool {
    return v < hasChildren
}

for _ in (0..<Q) {
    let (t, v) = inputIntTuple()
    switch t {
        case 0:
            printParent(v)
        case 1:
            printLeftChild(v)
        case 2:
            printRightChild(v)
        default: 
            fatalError("invalid operation")
    }
}
